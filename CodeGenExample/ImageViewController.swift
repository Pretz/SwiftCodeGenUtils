//
//  ImageViewController.swift
//  CodeGenExample
//
//  Created by Alex Pretzlav on 1/29/16.
//  Copyright © 2016 pretzlav. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    var imageToShow: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = imageToShow
    }
}
