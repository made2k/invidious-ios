//
//  VideoPReviewListViewController+ASTableDataSource.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit

extension VideoPreviewListViewController: ASTableDataSource {

  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return model.videos.count
  }

  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {

    let videoModel = model.videos[indexPath.row]

    return {
      return VideoPreviewCellNode(videoModel)
    }
  }

}
