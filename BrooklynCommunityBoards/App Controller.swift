//
//  App Controller.swift
//  BrooklynCommunityBoards
//
//  Created by Tanira Wiggins on 1/23/17.
//  Copyright © 2017 Tanira Wiggins. All rights reserved.
//

import Foundation
import UIKit


class AppController: UIViewController {
    
    var activeVC : UIViewController!
    
    @IBOutlet weak var containerView: UIView!
    
    
    
}




// N -> L -> S -> A || Notify -> Load -> Switch -> Add

// Create storyboard ID -> String Value
enum StoryboardID: String {
    
    case loginViewController = "login-view-controller"
    case registerViewController = "register-view-controller"
    case userHomeViewController = "user-homepage"
    case mapViewController = "map-view-controller"

}


//MARK: Create notification
extension Notification.Name {
    
    static let openLoginVC = Notification.Name("login-view-controller")
    static let openRegisterVC = Notification.Name("register-view-controller")
    static let openHomeVC = Notification.Name("user-homepage")
    static let openMapView = Notification.Name("map-view-controller")
    
}


// MARK: Create Notification Observers
extension AppController {
    
    func addNotificationObservers(){
        
    }
}

//MARK: - Loading View Controllers
extension AppController {
    
    //loads viewControllers based on identifier. need to create id -> pass value to activeVC -> add viewController
    func loadInitialViewController() {
        let id: StoryboardID = .loginViewController
        activeVC = loadViewController(withStoryboardID: id)
        add(viewController: activeVC, animated: true)
    }
    
    
    
    func loadViewController(withStoryboardID id: StoryboardID) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id.rawValue)
    }
}




// MARK: Switching Controllers 

extension AppController {
    
    func switchViewController(withNotification notification: Notification) {
        
      
        
        }
            
            
    
      
        
        
        
    
    
    func switchToViewController(withStoryboardID id: StoryboardID) {
        let existingVC = activeVC
        existingVC?.willMove(toParentViewController: nil)
        
        activeVC = loadViewController(withStoryboardID: id)
        addChildViewController(activeVC)
        add(viewController: activeVC)
        
        activeVC.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.activeVC.view.alpha = 1.0
            existingVC?.view.alpha = 0.0
            
        }, completion: { _ in
            
            print("Am I even being called")
            
            existingVC?.view.removeFromSuperview()
            existingVC?.removeFromParentViewController()
            self.activeVC.didMove(toParentViewController: self)
            
        })
    }
    
    
}



// MARK: - Adding View Controllers
extension AppController {
    // Have to create parent-child relationship to addd the subview
    func add(viewController: UIViewController, animated: Bool = false) {
        addChildViewController(viewController)
        
        containerView.addSubview(viewController.view)
        containerView.alpha = 0.0
        
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParentViewController: self)
        
        guard animated else { containerView.alpha = 1.0; return }
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.containerView.alpha = 1.0
        })
        
        
    }
}
