//
//  SubscriptionListCoordinator.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/13/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import MaterialComponents

class SubscriptionListCoordinator: NSObject, Coordinator {

  private let model: SubscriptionVideoListModel
  let navigation = MDCAppBarNavigationController()
  private let controller: VideoPreviewListViewController

  init(title: String?, icon: UIImage?) {
    model = SubscriptionVideoListModel()
    controller = VideoPreviewListViewController(model: model, title: title, image: icon)

    super.init()

    navigation.delegate = self
  }

  func start() {
    navigation.setViewControllers([controller], animated: false)
  }

}

extension SubscriptionListCoordinator: MDCAppBarNavigationControllerDelegate {

  func appBarNavigationController(_ navigationController: MDCAppBarNavigationController,
                                  willAdd appBarViewController: MDCAppBarViewController,
                                  asChildOf viewController: UIViewController) {
    appBarViewController.headerView.backgroundColor = .white
  }

}
