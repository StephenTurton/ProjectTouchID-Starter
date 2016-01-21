//
//    LoginViewController.swift
//    ProjectTouchId
//
//    Created by Stephen Turton on 1/16/16.
//
//    The MIT License (MIT)
//
//    Copyright (c) 2016 Stephen Turton
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.userNameText.borderStyle = .RoundedRect
        self.passwordText.borderStyle = .RoundedRect
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loginButtonClicked(sender: UIButton) {
        if self.validateLogin() {
            self.dismissViewControllerAnimated(true,completion:nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Username or password is incorrect.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default,handler: nil))
            presentViewController(alert, animated: true, completion:nil)
        }
    }

    func validateLogin() -> Bool {
        if self.userNameText.text == "secret" && self.passwordText.text == "password" {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(true, forKey: Constants.UserDefaults.IsLoggedInKey)
            return true
        } else {
            return false
        }
    }
}

extension LoginViewController : UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.isEqual(self.userNameText) {
            self.passwordText.becomeFirstResponder()
        }
        else {
            self.userNameText.becomeFirstResponder()
        }
        return true
    }
}
