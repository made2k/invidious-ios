//
//  HomeCoordinator.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import UIKit
import PromiseKit // TODO REMOVE
import API

class HomeCoordinator: NSObject, Coordinator {
  
  private let window: UIWindow
  private var childCoordinators: [Coordinator] = []

  private lazy var homeTabViewController: HomeTabViewController = {

    let homeNavigation = createHomeCoordiantor()

    let trending = UIViewController()
    trending.tabBarItem = UITabBarItem(title: R.string.homeTabs.trending(), image: R.image.trending(), tag: 0)
    trending.view.backgroundColor = .lightGray
    
    let subscriptions = UIViewController()
    subscriptions.tabBarItem = UITabBarItem(title: R.string.homeTabs.subscriptions(), image: R.image.subscriptions(), tag: 0)
    subscriptions.view.backgroundColor = .gray
    
    let library = UIViewController()
    library.tabBarItem = UITabBarItem(title: R.string.homeTabs.library(), image: R.image.library(), tag: 0)
    library.view.backgroundColor = .lightGray
    
    return HomeTabViewController(viewControllers: [homeNavigation, trending, subscriptions, library])
  }()
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    window.rootViewController = homeTabViewController
    window.makeKeyAndVisible()
  }

  private func createHomeCoordiantor() -> UIViewController {

    let loader: VideoPreviewRequest = { continuation -> Promise<([VideoPreview], String?)> in
      return Backend.shared.api.getTopVideos().map { ($0, nil) }
    }

    let coordinator = VideoListCoordinator(title: R.string.homeTabs.home(), icon: R.image.home(), request: loader)
    coordinator.start()
    childCoordinators.append(coordinator)

    return coordinator.navigation
  }
}
