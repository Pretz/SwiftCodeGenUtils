//
//  DetailViewController.swift
//  CodeGenExample
//
//  Created by Alex Pretzlav on 12/20/15.
//  Copyright © 2015 pretzlav. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var generatorType: GeneratorType = .None

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch generatorType {
        case .None:
            switch segue.identifier {
                case "ImageView"?:
                    if let dest = segue.destinationViewController as? ImageViewController {
                        dest.imageToShow = UIImage(named: "lolwut")
                }
            default:
                break
            }
        case .SwiftGen:
            switch StoryboardSegue.Main(rawValue: segue.identifier!) {
            case .ImageView?:
                if let dest = segue.destinationViewController as? ImageViewController {
                    dest.imageToShow = UIImage(named: "lolwut")
                }
            default:
                break
            }
        case .Natalie:
            guard let segueType: Segue = segue.selection() else { return }
            switch segueType {
            case .ImageView:
                if let dest = segue.destinationViewController as? ImageViewController {
                    dest.imageToShow = UIImage(named: "lolwut")
                }
            }
        case .R:
            if let segueInfo = R.segue.detailViewController.imageView(segue: segue) {
                segueInfo.destinationViewController.imageToShow = R.image.lolwut()
            }
        case .CodeGenUtils:
            switch segue.identifier {
            case MainStoryboardImageViewIdentifier?:
                if let dest = segue.destinationViewController as? ImageViewController {
                    dest.imageToShow = AssetsCatalog.lolwutImage()
                }
            default:
                break
            }
        }
    }

    @IBAction func normalButtonPressed(sender: AnyObject) {
        switch generatorType {
        case .None:
            performSegueWithIdentifier("ImageView", sender: self)
        case .SwiftGen:
            performSegue(StoryboardSegue.Main.ImageView)
        case .Natalie:
            performSegue(Segue.ImageView)
        case .R:
            performSegueWithIdentifier(R.segue.detailViewController.imageView, sender: self)
        case .CodeGenUtils:
            performSegueWithIdentifier(MainStoryboardImageViewIdentifier, sender: self)
        }
    }
}
