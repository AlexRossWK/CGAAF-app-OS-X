//
//  LogInVC.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 22.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Cocoa

class LogInVC: NSViewController {

    @IBOutlet weak var contractNoTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var enterButton: NSButton!
    @IBOutlet weak var saveLogPasw: NSButton!
    @IBOutlet weak var contactUsButton: NSButton!


    
}


//MARK: - View loads
extension LogInVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.darkGray.cgColor
        
        contractNoTextField.backgroundColor = .gray
        contractNoTextField.layer?.borderColor = .black
        contractNoTextField.layer?.borderWidth = 1.5

        
        passwordTextField.backgroundColor = .gray
        passwordTextField.layer?.borderColor = .black
        passwordTextField.layer?.borderWidth = 1.5

        enterButton.bezelStyle = .texturedSquare
        enterButton.isBordered = true
        enterButton.wantsLayer = true
        enterButton.layer?.backgroundColor = NSColor.lightGray.cgColor
        
        
//        contactUsButton.bezelStyle = .texturedSquare
//        contactUsButton.isBordered = true
//        contactUsButton.wantsLayer = true
//        contactUsButton.layer?.backgroundColor = NSColor.lightGray.cgColor
        
    }
}

//MARK: - Button Actions
extension LogInVC {
    @IBAction func saveLogPasswAction(_ sender: NSButton) {
        
    }
    @IBAction func enterButtonAction(_ sender: NSButton) {
        self.view.window?.close()
        performSegue(withIdentifier: NSStoryboardSegue.Identifier(rawValue: "loginToMain"), sender: nil)
    }
    
    @IBAction func contactUsButtonAction(_ sender: NSButton) {
        performSegue(withIdentifier: NSStoryboardSegue.Identifier(rawValue: "toContactUs"), sender: nil)
    }
    
}

//MARK: - Prepare for segue
extension LogInVC {
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        
    }
}
