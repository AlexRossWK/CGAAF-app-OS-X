//
//  ContuctUsVC.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 22.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Cocoa

class ContuctUsVC: NSViewController {
    
    @IBOutlet weak var popUp: NSPopUpButton!
    @IBOutlet weak var textView: NSScrollView!
    @IBOutlet weak var sendMessageButton: NSButton!
    
 
}

//MARK: - View loads
extension ContuctUsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.darkGray.cgColor
        
        popUp.removeAllItems()
        popUp.addItems(withTitles: ["About Platform", "Bug Report", "Feedback", "Other"])
        
        textView.drawsBackground = true
        textView.wantsLayer = true
        textView.backgroundColor = .gray
        textView.backgroundColor = .gray
        textView.layer?.borderColor = .black
        textView.layer?.borderWidth = 1.5
        
    }
}


//MARK: - UI actions
extension ContuctUsVC {

    @IBAction func sendMessageAction(_ sender: NSButton) {
        
    }
    
    @IBAction func popUpAction(_ sender: NSPopUpButton) {
    }
    
}



