//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Alvin Hsia on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var photoImage: UIImage!
    
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var doneButtonImageView: UIImageView!
    @IBOutlet weak var photoActionsImageView: UIImageView!
    
    var imageOriginalPos: CGRect!
    var scrollViewOffset: CGPoint!
    var dragging: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photoImageView.image = photoImage
        
        photoScrollView.contentSize = photoImageView.image!.size

        imageOriginalPos = photoImageView.frame
        
        photoScrollView.delegate = self
        photoImageView.clipsToBounds = true
        
        dragging = false
        
    }

    @IBAction func onDonePress(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // register for scroll began event
    // fade out done button and action buttons
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {

        print ("start scroll")
        
        doneButtonImageView.alpha = 0
        photoActionsImageView.alpha = 0
        dragging = true
    }
    

    // register for scroll moving event
    // fade scroll view background to white and alpha 0
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        print ("scrolling")
        
        scrollViewOffset = scrollView.contentOffset
        
        if dragging == true {
            if scrollViewOffset.y < 0 && scrollViewOffset.y > -70 {
                let alphaOffset = convertValue(CGFloat(scrollViewOffset.y), r1Min: 0, r1Max: -50, r2Min: 1, r2Max: 0)
                print("Alpha Offset \(alphaOffset)")
                scrollView.backgroundColor = UIColor(white: 0, alpha: CGFloat(alphaOffset))
            } else if scrollViewOffset.y < 70 && scrollViewOffset.y > 0 {
                let alphaOffset = convertValue(CGFloat(scrollViewOffset.y), r1Min: 0, r1Max: 50, r2Min: 1, r2Max: 0)
                print("Alpha Offset \(alphaOffset)")
                scrollView.backgroundColor = UIColor(white: 0, alpha: CGFloat(alphaOffset))
            }

        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.y < -50 {
            print("END -50")
            dragging = false
            dismissViewControllerAnimated(true, completion: nil)
            
        } else if scrollView.contentOffset.y > 50 {
            print("END 50")
            dragging = false
            dismissViewControllerAnimated(true, completion: nil)
            
        } else {
            print("Snap back")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.photoActionsImageView.alpha = 1
                self.doneButtonImageView.alpha = 1
                self.photoImageView.frame = self.imageOriginalPos
                self.photoScrollView.contentOffset = self.scrollViewOffset
            })
            dragging = false
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return photoImageView
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
