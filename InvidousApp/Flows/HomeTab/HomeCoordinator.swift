//
//  HomeCoordinator.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import PromiseKit
import RxSwift
import UIKit

class HomeCoordinator: NSObject, Coordinator {
  
  private let window: UIWindow

  private var childCoordinators: [Coordinator] = []
  private var homeTabViewController: HomeTabViewController?

  private let disposeBag = DisposeBag()
  
  init(window: UIWindow) {
    self.window = window
    super.init()
    setupBindings()
  }

  private func setupBindings() {

    // Refresh the tabs when the signed in user changes.
    // Down the road, will probably want to just have the subscription
    // and library tab change.
    Backend.shared.isUserSignedInObserver
      .distinctUntilChanged()
      .subscribe(onNext:{ _ in
        self.start()
      }).disposed(by: disposeBag)
  }
  
  func start() {

    let controller = createHomeTab()
    self.homeTabViewController = controller

    window.rootViewController = controller
    window.makeKeyAndVisible()
  }

  // MARK: - View Controller Creation

  private func createHomeTab() -> HomeTabViewController {
    childCoordinators.removeAll()

    let home = createHomeCoordiantor()
    let trending = createTrendingCoordinator()
    let subscriptions = createSubscriptionViewController()
    let library = createLibrary()

    return HomeTabViewController(viewControllers: [home, trending, subscriptions, library])
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

  private func createTrendingCoordinator() -> UIViewController {

    let loader: VideoPreviewRequest = { continuation -> Promise<([VideoPreview], String?)> in
      return Backend.shared.api.getTrendingVideos(genre: nil).map { ($0, nil) }
    }

    let coordinator = VideoListCoordinator(title: R.string.homeTabs.trending(), icon: R.image.trending(), request: loader)
    coordinator.start()
    childCoordinators.append(coordinator)

    return coordinator.navigation
  }

  private func createSubscriptionViewController() -> UIViewController {

    if Backend.shared.isUserSignedIn == false {
      let coordinator = NotSignedInCoordinator()
      coordinator.navigation.tabBarItem = UITabBarItem(title: R.string.homeTabs.subscriptions(), image: R.image.subscriptions(), tag: 0)
      childCoordinators.append(coordinator)

      coordinator.start()
      return coordinator.navigation
    }

    let coordinator = SubscriptionListCoordinator(title: R.string.homeTabs.subscriptions(), icon: R.image.subscriptions())
    coordinator.start()
    childCoordinators.append(coordinator)

    return coordinator.navigation
  }

  private func createLibrary() -> UIViewController {
    let temp = UIViewController()
    temp.tabBarItem = UITabBarItem(title: R.string.homeTabs.library(), image: R.image.library(), tag: 0)
    temp.view.backgroundColor = .lightGray
    return temp
  }
}
