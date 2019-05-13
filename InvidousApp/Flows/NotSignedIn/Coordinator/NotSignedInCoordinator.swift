//
//  NotSignedInCoordinator.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import MaterialComponents

class NotSignedInCoordinator: NSObject, Coordinator {

  let navigation = MDCAppBarNavigationController()
  private lazy var controller: NotSignedInViewController = {
    return NotSignedInViewController(delegate: self)
  }()

  override init() {
    super.init()
    navigation.delegate = self
  }

  func start() {
    navigation.setViewControllers([controller], animated: false)
  }

}

extension NotSignedInCoordinator: MDCAppBarNavigationControllerDelegate {

  func appBarNavigationController(_ navigationController: MDCAppBarNavigationController,
                                  willAdd appBarViewController: MDCAppBarViewController,
                                  asChildOf viewController: UIViewController) {
    appBarViewController.headerView.backgroundColor = .white
  }

}

