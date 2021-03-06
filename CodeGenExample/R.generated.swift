// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import Foundation
import Rswift
import UIKit

struct R: Rswift.Validatable {
  static func validate() throws {
    try intern.validate()
  }
  
  struct file {
    
  }
  
  struct font {
    
  }
  
  struct image {
    static let lolwut = ImageResource(bundle: _R.hostingBundle, name: "lolwut")
    
    static func lolwut(compatibleWithTraitCollection traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.lolwut, compatibleWithTraitCollection: traitCollection)
    }
  }
  
  private struct intern: Rswift.Validatable {
    static func validate() throws {
      try _R.validate()
    }
  }
  
  struct nib {
    
  }
  
  struct reuseIdentifier {
    static let cell: ReuseIdentifier<UITableViewCell> = ReuseIdentifier(identifier: "Cell")
  }
  
  struct segue {
    struct detailViewController {
      static let imageView: StoryboardSegueIdentifier<UIStoryboardSegue, DetailViewController, ImageViewController> = StoryboardSegueIdentifier(identifier: "ImageView")
      
      static func imageView(segue segue: UIStoryboardSegue) -> TypedStoryboardSegueInfo<UIStoryboardSegue, DetailViewController, ImageViewController>? {
        return TypedStoryboardSegueInfo(segueIdentifier: R.segue.detailViewController.imageView, segue: segue)
      }
    }
    
    struct masterViewController {
      static let showDetail: StoryboardSegueIdentifier<UIStoryboardSegue, MasterViewController, UINavigationController> = StoryboardSegueIdentifier(identifier: "showDetail")
      
      static func showDetail(segue segue: UIStoryboardSegue) -> TypedStoryboardSegueInfo<UIStoryboardSegue, MasterViewController, UINavigationController>? {
        return TypedStoryboardSegueInfo(segueIdentifier: R.segue.masterViewController.showDetail, segue: segue)
      }
    }
  }
  
  struct storyboard {
    static let launchScreen = _R.storyboard.launchScreen()
    static let main = _R.storyboard.main()
    
    static func launchScreen(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    static func main(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.main)
    }
  }
}

struct _R: Rswift.Validatable {
  static let hostingBundle = NSBundle(identifier: "com.pretzlav.CodeGenExample")
  
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct launchScreen: StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIViewController
      
      let bundle = _R.hostingBundle
      let name = "LaunchScreen"
    }
    
    struct main: StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UISplitViewController
      
      let bundle = _R.hostingBundle
      let name = "Main"
      
      func detailViewController() -> DetailViewController? {
        return UIStoryboard(resource: self).instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController
      }
      
      func imageViewController() -> ImageViewController? {
        return UIStoryboard(resource: self).instantiateViewControllerWithIdentifier("ImageViewController") as? ImageViewController
      }
      
      static func validate() throws {
        if _R.storyboard.main().detailViewController() == nil { throw ValidationError(description:"[R.swift] ViewController with identifier 'detailViewController' could not be loaded from storyboard 'Main' as 'DetailViewController'.") }
        if _R.storyboard.main().imageViewController() == nil { throw ValidationError(description:"[R.swift] ViewController with identifier 'imageViewController' could not be loaded from storyboard 'Main' as 'ImageViewController'.") }
      }
    }
  }
}