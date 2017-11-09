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
    
    @IBOutlet weak var leftThumbBack: UIButton!
    @IBOutlet weak var leftThumbDel: UIButton!
    @IBOutlet weak var leftThumbCtrl: UIButton!
    @IBOutlet weak var leftThumbAlt: UIButton!
    @IBOutlet weak var leftThumbHome: UIButton!
    @IBOutlet weak var leftThumbEdit: UIButton!
    
    @IBOutlet weak var rightThumbSpace: UIButton!
    @IBOutlet weak var rightThumbReturn: UIButton!
    @IBOutlet weak var rightThumbCtrl: UIButton!
    @IBOutlet weak var rightThumbAlt: UIButton!
    @IBOutlet weak var rightThumbUp: UIButton!
    @IBOutlet weak var rightThumbDown: UIButton!
    
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
        
//        self.leftThumbBack.transform = self.leftThumbBack.transform.rotated(by: CGFloat(M_PI_2/2))
//        self.leftThumbDel.transform = self.leftThumbDel.transform.rotated(by: CGFloat(M_PI_2/2))
//        self.leftThumbCtrl.transform = self.leftThumbCtrl.transform.rotated(by: CGFloat(M_PI_2/2))
//        self.leftThumbAlt.transform = self.leftThumbAlt.transform.rotated(by: CGFloat(M_PI_2/2))
//        self.leftThumbHome.transform = self.leftThumbHome.transform.rotated(by: CGFloat(M_PI_2/2))
//        self.leftThumbEdit.transform = self.leftThumbEdit.transform.rotated(by: CGFloat(M_PI_2/2))
        
        self.rightThumbSpace.transform = self.rightThumbSpace.transform.rotated(by: CGFloat(-M_PI_2/2))
        self.rightThumbReturn.transform = self.rightThumbReturn.transform.rotated(by: CGFloat(-M_PI_2/2))
        self.rightThumbCtrl.transform = self.rightThumbCtrl.transform.rotated(by: CGFloat(-M_PI_2/2))
        self.rightThumbAlt.transform = self.rightThumbAlt.transform.rotated(by: CGFloat(-M_PI_2/2))
        self.rightThumbUp.transform = self.rightThumbUp.transform.rotated(by: CGFloat(-M_PI_2/2))
        self.rightThumbDown.transform = self.rightThumbDown.transform.rotated(by: CGFloat(-M_PI_2/2))
    }

}
