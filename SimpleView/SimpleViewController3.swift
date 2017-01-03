//
//  SimpleViewController3.swift
//  SimpleView
//
//  Created by Daesub Kim on 2016. 11. 22..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class SimpleViewController3: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var aScrollView: UIScrollView!

    var imageView: UIImageView!
    var scaleFactor: Double = 1.0
    
    func setZoomScale() {
        var imageViewSize = imageView.bounds.size
        print("imageViewSize=\(imageViewSize)")
        var aScrollViewSize = aScrollView.bounds.size
        print("aScrollViewSize=\(aScrollViewSize)")
        
        
        
        var widthScale = aScrollViewSize.width / imageViewSize.width
        var heightScale = aScrollViewSize.height / imageViewSize.height
        
        
        print("widthScale=\(widthScale) heightScale=\(heightScale)")
        
        aScrollView.minimumZoomScale = min(widthScale, heightScale)
        aScrollView.zoomScale = 1.0
    }
 
    func centerScrollViewContents() {
        let boundsSize = aScrollView.bounds.size
        var contentsFrame = imageView.frame
        
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        imageView.frame = contentsFrame
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        print("doubletapped recognizer")
        
        // 1
        let pointInView = recognizer.locationInView(imageView)
        
        // 2
        var newZoomScale = aScrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, aScrollView.maximumZoomScale)
        
        // 3
        let scrollViewSize = aScrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        
        let rectToZoomTo = CGRectMake(x, y, w, h);
        
        // 4
        aScrollView.zoomToRect(rectToZoomTo, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "UIScrollView"
        
        // 1
        let image = UIImage(named:"RedondoBeach")
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image!.size)
        aScrollView.addSubview(imageView)
        
        // 2
        aScrollView.contentSize = image!.size
        
        // 3
        //let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        //doubleTapRecognizer.numberOfTapsRequired = 2
        //doubleTapRecognizer.numberOfTouchesRequired = 1
        //aScrollView.addGestureRecognizer(doubleTapRecognizer)
        
        // 4
        //let scrollViewFrame = aScrollView.frame
        //let scaleWidth = scrollViewFrame.size.width / aScrollView.contentSize.width
        //let scaleHeight = scrollViewFrame.size.height / aScrollView.contentSize.height
        //let minScale = min(scaleWidth, scaleHeight);
        //aScrollView.minimumZoomScale = minScale;
        
        // 5
        //aScrollView.maximumZoomScale = 1.0
        //aScrollView.zoomScale = minScale;
        setZoomScale()
        
        // 6
        //centerScrollViewContents()
        
        aScrollView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //let foregroundHeight = self.scrollView.contentSize.height - CGRectGetHeight(self.scrollView.bounds)
        //let percentageScroll = self.scrollView.contentOffset.y / foregroundHeight
        //self.scrollView.contentOffset = CGPoint(x: 0, y: foregroundHeight * percentageScroll) // vertical scrolling only
        aScrollView.contentOffset = CGPoint(x: aScrollView.contentOffset.x, y: aScrollView.contentOffset.y)
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}


