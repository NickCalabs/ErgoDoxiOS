//
//  KeyboardViewController.swift
//  DoxKeyboard
//
//  Created by Nick on 11/5/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    @IBOutlet weak var leftThumbView: UIView!
    @IBOutlet weak var rightThumbView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rotateThumbs()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    @IBAction func actuation(sender: UIButton!) {
        let typedChar = sender.titleLabel?.text
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(typedChar!)
    }
    
    @IBAction func spaceActuate() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(" ")
    }
    
    @IBAction func hideBoard() {
        dismissKeyboard()
    }
    
    @IBAction func delete() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    @IBAction func moveRight() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.adjustTextPosition(byCharacterOffset: 1)
    }
    
    @IBAction func moveLeft() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.adjustTextPosition(byCharacterOffset: -1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    func rotateThumbs() {
        self.leftThumbView.transform = self.leftThumbView.transform.rotated(by: CGFloat(M_PI_2/2))
        self.rightThumbView.transform = self.rightThumbView.transform.rotated(by: CGFloat(-M_PI_2/2))
        
    }

}
