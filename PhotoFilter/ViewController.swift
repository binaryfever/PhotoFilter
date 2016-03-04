//
//  ViewController.swift
//  PhotoFilter
//
//  Created by Frederick McHale on 3/4/16.
//  Copyright © 2016 binaryfever. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        
        //Create the image to filter
        let inputImage = CIImage(image: photoImageView.image!)
        
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314))/100)]
        
        let filteredImage = inputImage?.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        let renderedImage = context.createCGImage(filteredImage!
            , fromRect: filteredImage!.extent)
        
        photoImageView.image = UIImage(CGImage: renderedImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

