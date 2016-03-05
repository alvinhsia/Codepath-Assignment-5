//
//  ImageTransition.swift
//  Facebook
//
//  Created by Alvin Hsia on 3/4/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabBarController = fromViewController as! UITabBarController
        let navController = tabBarController.viewControllers![0] as! UINavigationController
        let newsFeedViewController = navController.viewControllers[0] as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        newsFeedViewController.pressedImageView.hidden = true
        
        photoViewController.photoImageView.hidden = true
        
        var tempImageView = UIImageView(image: newsFeedViewController.pressedImageView.image)
        tempImageView.frame = newsFeedViewController.pressedImageView.frame
        tempImageView.contentMode = newsFeedViewController.pressedImageView.contentMode
        tempImageView.clipsToBounds = photoViewController.photoImageView.clipsToBounds
        containerView.addSubview(tempImageView)
        
        var frameInScrollView = containerView.convertRect(newsFeedViewController.pressedImageView.frame, fromView: newsFeedViewController.scrollView)
        
        // Starting positions
        
        tempImageView.frame = frameInScrollView
        photoViewController.photoScrollView.backgroundColor = UIColor(white: 0, alpha: 0)
        photoViewController.photoActionsImageView.alpha = 0
        photoViewController.doneButtonImageView.alpha = 0
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            tempImageView.frame = photoViewController.photoImageView.frame
            photoViewController.photoScrollView.backgroundColor = UIColor(white: 0, alpha: 1)
            photoViewController.photoActionsImageView.alpha = 1
            photoViewController.doneButtonImageView.alpha = 1
            
            }) { (Bool) -> Void in
                self.finish()
                photoViewController.photoImageView.hidden = false
                tempImageView.removeFromSuperview()
                
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabBarController = toViewController as! UITabBarController
        let navController = tabBarController.viewControllers![0] as! UINavigationController
        let newsFeedViewController = navController.viewControllers[0] as! NewsFeedViewController

        let photoViewController = fromViewController as! PhotoViewController
        
        newsFeedViewController.pressedImageView.hidden = true
        
        photoViewController.photoImageView.hidden = true
        
        var tempImageView = UIImageView(image: photoViewController.photoImageView.image)
        tempImageView.frame = photoViewController.photoImageView.frame
        tempImageView.contentMode = photoViewController.photoImageView.contentMode
        tempImageView.clipsToBounds = photoViewController.photoImageView.clipsToBounds
        containerView.addSubview(tempImageView)
        
        var frameInScrollView = containerView.convertRect(photoViewController.photoImageView.frame, fromView: photoViewController.photoScrollView)
        
        var newsFrameInScrollView = containerView.convertRect(newsFeedViewController.pressedImageView.frame, fromView: newsFeedViewController.scrollView)
        
        tempImageView.frame = frameInScrollView
        
        UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            tempImageView.frame = newsFrameInScrollView
            photoViewController.photoScrollView.backgroundColor = UIColor(white: 0, alpha: 0)
            photoViewController.photoActionsImageView.alpha = 0
            photoViewController.doneButtonImageView.alpha = 0
            
            
            }) { (Bool) -> Void in
                
                self.finish()
                newsFeedViewController.pressedImageView.hidden = false
                tempImageView.removeFromSuperview()
            }
    }
}
