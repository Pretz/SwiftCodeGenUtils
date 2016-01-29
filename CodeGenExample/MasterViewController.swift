//
//  MasterViewController.swift
//  CodeGenExample
//
//  Created by Alex Pretzlav on 12/20/15.
//  Copyright © 2015 pretzlav. All rights reserved.
//

import UIKit


enum GeneratorType: Int {
    case SwiftGen
    case Natalie
    case R
    case CodeGenUtils
    case None
}

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    var generatorType = GeneratorType.None

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    @IBAction func segmentedControlChanged(sender: AnyObject?) {
        if let type = GeneratorType(rawValue: segmentedControl.selectedSegmentIndex) {
            generatorType = type
        }
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch generatorType {
        case .None:
            if segue.identifier == "showDetail" {
                prepareDestinationForDetailSegue(segue.destinationViewController as! UINavigationController)
            }
        case .SwiftGen:
            if StoryboardSegue.Main(rawValue: segue.identifier!) == .ShowDetail {
                prepareDestinationForDetailSegue(segue.destinationViewController as! UINavigationController)
            }
        case .Natalie:
            if segue == Segue.showDetail {
                prepareDestinationForDetailSegue(segue.destinationViewController as! UINavigationController)
            }
        case .R:
            if let info = R.segue.masterViewController.showDetail(segue: segue) {
                prepareDestinationForDetailSegue(info.destinationViewController)
            }
        case .CodeGenUtils:
            if segue.identifier == MainStoryboardShowDetailIdentifier {
                prepareDestinationForDetailSegue(segue.destinationViewController as! UINavigationController)
            }
        }
    }

    func prepareDestinationForDetailSegue(destination: UINavigationController) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let object = objects[indexPath.row] as! NSDate
            let controller = destination.topViewController as! DetailViewController
            controller.detailItem = object
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
            controller.navigationItem.leftItemsSupplementBackButton = true
            controller.generatorType = generatorType
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

