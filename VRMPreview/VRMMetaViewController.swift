//
//  VRMMetaViewController.swift
//  VRMPreview
//
//  Created by magicien on 2018/08/08.
//  Copyright © 2018 DarkHorse. All rights reserved.
//

import Cocoa
import GLTFSceneKit

class VRMMetaViewController: NSViewController {
    @IBOutlet var titleText: NSTextField!
    @IBOutlet var authorText: NSTextField!
    @IBOutlet var contactInformationText: NSTextField!
    @IBOutlet var referenceText: NSTextField!
    @IBOutlet var textureText: NSTextField!
    @IBOutlet var versionText: NSTextField!
    @IBOutlet var allowedUserNameText: NSTextField!
    @IBOutlet var violentUssageNameText: NSTextField!
    @IBOutlet var sexualUssageNameText: NSTextField!
    @IBOutlet var commercialUssageNameText: NSTextField!
    @IBOutlet var otherPermissionUrlText: NSTextField!
    @IBOutlet var licenseNameText: NSTextField!
    @IBOutlet var otherLicenseUrlText: NSTextField!

    func setMetadata(_ data: [String:Any]) {
        self.titleText.stringValue = data["title"] as? String ?? ""
        self.authorText.stringValue = data["author"] as? String ?? ""
        self.contactInformationText.stringValue = data["contactInformation"] as? String ?? ""
        self.referenceText.stringValue = data["reference"] as? String ?? ""
        self.textureText.integerValue = data["texture"] as? Int ?? 0
        self.versionText.stringValue = data["version"] as? String ?? ""
        self.allowedUserNameText.stringValue = data["allowedUserName"] as? String ?? ""
        self.violentUssageNameText.stringValue = data["violentUssageName"] as? String ?? ""
        self.sexualUssageNameText.stringValue = data["sexualUssageName"] as? String ?? ""
        self.commercialUssageNameText.stringValue = data["commercialUssageName"] as? String ?? ""
        self.otherPermissionUrlText.stringValue = data["otherPermissionUrl"] as? String ?? ""
        self.licenseNameText.stringValue = data["licenseName"] as? String ?? ""
        self.otherLicenseUrlText.stringValue = data["otherLicenseUrl"] as? String ?? ""
    }
    
    func resetMetadata() {
        self.titleText.stringValue = ""
        self.authorText.stringValue = ""
        self.contactInformationText.stringValue = ""
        self.referenceText.stringValue = ""
        self.textureText.stringValue = ""
        self.versionText.stringValue = ""
        self.allowedUserNameText.stringValue = ""
        self.violentUssageNameText.stringValue = ""
        self.sexualUssageNameText.stringValue = ""
        self.commercialUssageNameText.stringValue = ""
        self.otherPermissionUrlText.stringValue = ""
        self.licenseNameText.stringValue = ""
        self.otherLicenseUrlText.stringValue = ""
    }
}
