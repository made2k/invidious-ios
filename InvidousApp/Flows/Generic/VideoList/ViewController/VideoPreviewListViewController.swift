//
//  VideoPreviewListViewController.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit

class VideoPreviewListViewController: ASViewController<ASCollectionNode> {

  // MARK: - Collection calculations

  let minColumnWidth: CGFloat = 300

  var numberOfColumns: Int {
    return Int(node.frame.width / minColumnWidth)
  }

  var sectionInsets: UIEdgeInsets {
    let sideInsets: CGFloat = numberOfColumns > 1 ? 16 : 0
    return UIEdgeInsets(top: 0, left: sideInsets, bottom: 0, right: sideInsets)
  }

  var minimumInterimSpacing: CGFloat {
    return flowLayout.minimumInteritemSpacing
  }

  // MARK: - Properties

  let model: VideoListModel
  private let flowLayout: UICollectionViewFlowLayout

  // MARK: - Initialization

  init(model: VideoListModel, title: String?, image: UIImage?) {
    self.model = model

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumInteritemSpacing = 8
    self.flowLayout = flowLayout

    let node = ASCollectionNode(collectionViewLayout: flowLayout)

    super.init(node: node)

    node.dataSource = self
    node.batchFetchingDelegate = self
    node.delegate = self

    self.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Lifecycle

  override func viewWillLayoutSubviews() {
    flowLayout.sectionInset = sectionInsets
    super.viewWillLayoutSubviews()
  }

}
