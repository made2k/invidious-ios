//
//  VideoListCoordinator.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import UIKit

class VideoListCoordinator: Coordinator {

  private let model: VideoListModel
  let navigation = UINavigationController()
  private let controller: VideoPreviewListViewController

  init(title: String?, icon: UIImage?, request: @escaping VideoPreviewRequest) {
    model = VideoListModel(loader: request)
    controller = VideoPreviewListViewController(model: model, title: title, image: icon)
  }

  func start() {
    navigation.setViewControllers([controller], animated: false)
  }

}
