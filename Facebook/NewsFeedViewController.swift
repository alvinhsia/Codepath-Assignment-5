//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedLoadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var weddingImageView1: UIImageView!
    @IBOutlet weak var weddingImageView2: UIImageView!
    @IBOutlet weak var weddingImageView3: UIImageView!
    @IBOutlet weak var weddingImageView4: UIImageView!
    @IBOutlet weak var weddingImageView5: UIImageView!
    
    @IBOutlet weak var feedViewHolder: UIView!
    
    var pressedImageView: UIImageView!
    
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
        
        imageTransition = ImageTransition()
    }
    
    // Right before the ViewController "appears"...
    override func viewWillAppear(animated: Bool) {
        // hide feed ImageView
        feedViewHolder.hidden = true
        
        // turn on the activity indicator
        feedLoadingIndicator.startAnimating()
    }
    
    // The moment the ViewController "appears"...
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
        
                // Delay for 2 seconds before...
                delay(1) { () -> () in
                    // show the feed ImageView
                    self.feedViewHolder.hidden = false
                    // Stop the activity indicator
                    self.feedLoadingIndicator.stopAnimating()
                }
        
    }

    @IBAction func didTapImage(sender: UITapGestureRecognizer) {
        
        pressedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = imageTransition
        
        destinationViewController.photoImage = pressedImageView.image
        
//        destinationViewController.view.layoutIfNeeded()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
