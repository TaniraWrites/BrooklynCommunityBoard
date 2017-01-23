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

}


// Create notification
extension Notification.Name {
    
    static let openLoginVC = Notification.Name("login-view-controller")
    static let openRegisterVC = Notification.Name("register-view-controller")
    static let openHomeVC = Notification.Name("user-homepage")
    
}

