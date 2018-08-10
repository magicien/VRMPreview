//
//  VRMMetaWindowSegue.swift
//  VRMPreview
//
//  Created by magicien on 2018/08/07.
//  Copyright © 2018 DarkHorse. All rights reserved.
//

import Cocoa

class VRMMetaWindowSegue: NSStoryboardSegue {
    override func perform() {
        guard let srcController = self.sourceController as? VRMViewController else { return }
        guard let dstController = self.destinationController as? VRMMetaWindowController else { return }
        
        srcController.metaWindowController = dstController
        
        super.perform()
    }
}
