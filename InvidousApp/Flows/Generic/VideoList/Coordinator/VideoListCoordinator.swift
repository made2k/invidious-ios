//
//  VideoListCoordinator.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import MaterialComponents

class VideoListCoordinator: NSObject, Coordinator {

  private let model: VideoListModel
  let navigation = MDCAppBarNavigationController()
  private let controller: VideoPreviewListViewController

  init(title: String?, icon: UIImage?, request: @escaping VideoPreviewRequest) {
    model = VideoListModel(loader: request)
    controller = VideoPreviewListViewController(model: model, title: title, image: icon)

    super.init()

    navigation.delegate = self
  }

  func start() {
    navigation.setViewControllers([controller], animated: false)
  }

}

extension VideoListCoordinator: MDCAppBarNavigationControllerDelegate {

  func appBarNavigationController(_ navigationController: MDCAppBarNavigationController,
                                  willAdd appBarViewController: MDCAppBarViewController,
                                  asChildOf viewController: UIViewController) {
    appBarViewController.headerView.backgroundColor = .white
  }

}
