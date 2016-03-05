//
//  LoginViewController.swift
//  Facebook
//
//  Created by Alvin Hsia on 2/10/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    
    var logoImageViewinitialY: CGFloat!
    var logoImageViewoffset: CGFloat!
    var fieldParentViewinitialY: CGFloat!
    var fieldParentViewoffset: CGFloat!
    var labelParentViewinitialY: CGFloat!
    var labelParentViewoffset: CGFloat!

    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // Set up Alert Controller
    let errorAlertController = UIAlertController(title: "Invalid Email or Password ", message: "Your email or password is incorrect. Please try again.", preferredStyle: .Alert)
    // create a cancel action
    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        

        logoImageViewinitialY = logoImageView.frame.origin.y
        logoImageViewoffset = -100
        fieldParentViewinitialY = fieldParentView.frame.origin.y
        fieldParentViewoffset = -100
        labelParentViewinitialY = labelParentView.frame.origin.y
        labelParentViewoffset = -240
        
        // add the cancel action to the alertController
        errorAlertController.addAction(cancelAction)
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            loginButton.enabled = false
        }
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
//        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
//        fieldParentViewoffset = -frame.height

        logoImageView.frame.origin.y = logoImageViewinitialY + logoImageViewoffset
        fieldParentView.frame.origin.y = fieldParentViewinitialY + fieldParentViewoffset
        labelParentView.frame.origin.y = labelParentViewinitialY + labelParentViewoffset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        logoImageView.frame.origin.y = logoImageViewinitialY
        fieldParentView.frame.origin.y = fieldParentViewinitialY
        labelParentView.frame.origin.y = labelParentViewinitialY

        loginIndicator.stopAnimating()
        loginButton.selected = false
    }
    
    @IBAction func onTapOut(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func passwordOnEditingChanged(sender: UITextField) {
        if !emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty {
            loginButton.enabled = true
        }
        
        else {
            loginButton.enabled = false
        }
    }
    

    @IBAction func onTapLoginButton(sender: UIButton) {
        loginButton.selected = true
        loginIndicator.startAnimating()
        
        delay(2) {
            if self.emailTextField.text! == "ah" && self.passwordTextField.text! == "ah" {
                self.performSegueWithIdentifier("loginModalSegue", sender: self)
            }
                
            else {
                self.presentViewController(self.errorAlertController, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
