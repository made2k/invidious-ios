//
//  HomeCoordinator.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator {
  
  private let window: UIWindow
  private lazy var homeTabViewController: HomeTabViewController = {
    
    let home = ViewController()
    home.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
    home.view.backgroundColor = .gray
    
    let trending = ViewController()
    trending.tabBarItem = UITabBarItem(title: "Trending", image: nil, tag: 0)
    trending.view.backgroundColor = .lightGray
    
    let subscriptions = ViewController()
    subscriptions.tabBarItem = UITabBarItem(title: "Subscriptions", image: nil, tag: 0)
    subscriptions.view.backgroundColor = .gray
    
    let library = ViewController()
    library.tabBarItem = UITabBarItem(title: "Library", image: nil, tag: 0)
    library.view.backgroundColor = .lightGray
    
    return HomeTabViewController(viewControllers: [home, trending, subscriptions, library])
  }()
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    window.rootViewController = homeTabViewController
    window.makeKeyAndVisible()
  }

}
