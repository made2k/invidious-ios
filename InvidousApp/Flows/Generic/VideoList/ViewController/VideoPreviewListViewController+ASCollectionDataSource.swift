//
//  VideoPReviewListViewController+ASCollectionDataSource.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit

extension VideoPreviewListViewController: ASCollectionDataSource {

  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    return model.videos.count
  }

  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    let videoModel = model.videos[indexPath.row]

    return {
      return VideoPreviewCellNode(videoModel)
    }
  }

}
