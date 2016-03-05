//
//  SettingsViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSizeMake(320, settingsImageView.image!.size.height)
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }

    @IBAction func onTapLogout(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "", message: "Are you sure you want to log out?", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            // handle case of user logging out
            self.performSegueWithIdentifier("logoutModalSegue", sender: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
