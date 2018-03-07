//
//  ViewController.swift
//  Test
//
//  Created by Josh Guffey on 3/6/18.
//  Copyright © 2018 wallyou. All rights reserved.
//

import UIKit

/*
 * Remember to set the delegate of the labels that you want to zoom to this VC.
 * Minimal amount of code is below.
 */

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var nextFocusedFieldRect: CGRect? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onKeyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onKeyboardDidShow(_ notification: Notification) {
        print("keyboard will show")
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRect = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRect.height
            
            if let nextFocusedRect = self.nextFocusedFieldRect {
                UIView.animate(withDuration: 0.5) {
                    let availableHeight = UIScreen.main.bounds.height - keyboardHeight
                    let offset = (availableHeight / 2) - (nextFocusedRect.height / 2)
                    self.scrollView.contentOffset = CGPoint(x: 0, y: nextFocusedRect.origin.y - offset)
                }
            }
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("editing fired showed")
        nextFocusedFieldRect = textField.frame
        return true
    }

}

