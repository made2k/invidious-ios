//
//  VideoPreviewListViewController.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit

class VideoPreviewListViewController: ASViewController<ASTableNode> {

  let model: VideoListModel

  init(model: VideoListModel, title: String?, image: UIImage?) {
    self.model = model

    let node = ASTableNode(style: .plain)

    super.init(node: node)

    node.dataSource = self
    node.batchFetchingDelegate = self
    node.delegate = self

    self.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
