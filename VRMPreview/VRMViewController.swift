//
//  VRMViewController.swift
//  VRMPreview
//
//  Created by magicien on 2018/08/07.
//  Copyright © 2018 DarkHorse. All rights reserved.
//

import SceneKit
import QuartzCore
import GLTFSceneKit

class VRMViewController: NSViewController {

    @IBOutlet weak var vrmView: VRMView!
    @IBOutlet weak var openFileButton: NSButton!
    @IBOutlet weak var cameraSelect: NSPopUpButton!
    
    var metaWindowController: VRMMetaWindowController? {
        didSet {
            guard let controller = self.metaWindowController?.window?.contentViewController as? VRMMetaViewController else { return }

            if let data = self.vrmView?.scene?.value(forKey: "VRMMeta") as? [String:Any] {
                controller.setMetadata(data)
            } else {
                controller.resetMetadata()
            }
        }
    }
    
    var cameraNodes: [SCNNode] = []
    let defaultCameraTag: Int = 99
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        var scene: SCNScene
        do {
            let sceneSource = try GLTFSceneSource(named: "art.scnassets/AliciaSolid/AliciaSolid_vrm-0.40.vrm")
            scene = try sceneSource.scene()
        } catch {
            print("\(error.localizedDescription)")
            return
        }
        
        self.setScene(scene)
        
        self.vrmView!.autoenablesDefaultLighting = true
        
        // allows the user to manipulate the camera
        self.vrmView!.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        self.vrmView!.showsStatistics = true
        
        // configure the view
        self.vrmView!.backgroundColor = NSColor.gray
        
        self.vrmView!.addObserver(self, forKeyPath: "pointOfView", options: [.new], context: nil)
    }
    
    func setScene(_ scene: SCNScene) {
        // update camera names
        self.cameraNodes = scene.rootNode.childNodes(passingTest: { (node, finish) -> Bool in
            return node.camera != nil
        })
        
        // set the scene to the view
        self.vrmView!.scene = scene
        
        // set the camera menu
        self.cameraSelect.menu?.removeAllItems()
        if self.cameraNodes.count > 0 {
            self.cameraSelect.removeAllItems()
            let titles = self.cameraNodes.map { $0.camera?.name ?? "untitled" }
            for title in titles {
                self.cameraSelect.menu?.addItem(withTitle: title, action: nil, keyEquivalent: "")
            }
            self.vrmView!.pointOfView = self.cameraNodes[0]
        }
        
        //to give nice reflections :)
        scene.lightingEnvironment.contents = "art.scnassets/shinyRoom.jpg"
        scene.lightingEnvironment.intensity = 2;
        
        let defaultCameraItem = NSMenuItem(title: "SCNViewFreeCamera", action: nil, keyEquivalent: "")
        defaultCameraItem.tag = self.defaultCameraTag
        defaultCameraItem.isEnabled = false
        self.cameraSelect.menu?.addItem(defaultCameraItem)
        
        self.cameraSelect.autoenablesItems = false
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "pointOfView", let change = change {
            if let cameraNode = change[.newKey] as? SCNNode {
                // It must use the main thread to change the UI.
                DispatchQueue.main.async {
                    if let index = self.cameraNodes.index(of: cameraNode) {
                        self.cameraSelect.selectItem(at: index)
                    } else {
                        self.cameraSelect.selectItem(withTag: self.defaultCameraTag)
                    }
                }
            }
        }
    }
    
    @IBAction func openFileButtonClicked(_ sender: Any) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false
        openPanel.allowsMultipleSelection = false
        openPanel.allowedFileTypes = ["vrm"]
        openPanel.message = "Choose VRM file"
        openPanel.begin { (response) in
            if response == .OK {
                guard let url = openPanel.url else { return }

                // self.setWindowTitle("Loading...")
                // self.setScene(SCNScene())
                do {
                    let sceneSource = GLTFSceneSource(url: url)
                    let scene = try sceneSource.scene()
                    self.setWindowTitle(url.lastPathComponent)
                    self.setScene(scene)
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
    }
    
    @IBAction func selectCamera(_ sender: Any) {
        let index = self.cameraSelect.indexOfSelectedItem
        let cameraNode = self.cameraNodes[index]
        self.vrmView!.pointOfView = cameraNode
    }
    
    func setWindowTitle(_ title: String) {
        NSApplication.shared.mainWindow?.title = title
    }
}

