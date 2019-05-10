//
//  AppDelegate.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private var coordinator: Coordinator?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    initializeApplicationSettings()
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    
    coordinator = HomeCoordinator(window: window)
    coordinator?.start()
        
    return true
  }
  
  private func initializeApplicationSettings() {
    ApplicatinSettings.shared.configure()
  }

}

