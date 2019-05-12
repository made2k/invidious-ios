//
//  AppDelegate.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Toaster
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private var coordinator: Coordinator?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    initializeApplicationSettings()
    setupToastView()
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    
    coordinator = HomeCoordinator(window: window)
    coordinator?.start()
        
    return true
  }
  
  private func initializeApplicationSettings() {
    ApplicationSettings.shared.configure()
  }

  private func setupToastView() {
    ToastView.appearance().bottomOffsetPortrait = 65
    ToastView.appearance().bottomOffsetLandscape = 55
  }

}

