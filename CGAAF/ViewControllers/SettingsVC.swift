//
//  SettingsVC.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 27.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Foundation
import Cocoa

class SettingsVC: NSViewController {
    
    @IBOutlet weak var newPassword: NSTextField!
    
    @IBOutlet weak var repeatNewPassword: NSSecureTextField!
    
    @IBOutlet weak var changeButton: NSButton!
}


//MARK: - View loads
extension SettingsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.darkGray.cgColor
        
        newPassword.backgroundColor = .gray
        newPassword.layer?.borderColor = .black
        newPassword.layer?.borderWidth = 1.5
        
        
        repeatNewPassword.backgroundColor = .gray
        repeatNewPassword.layer?.borderColor = .black
        repeatNewPassword.layer?.borderWidth = 1.5
        
        changeButton.bezelStyle = .texturedSquare
        changeButton.isBordered = true
        changeButton.wantsLayer = true
        changeButton.layer?.backgroundColor = NSColor.lightGray.cgColor
        
        

        
    }
}
