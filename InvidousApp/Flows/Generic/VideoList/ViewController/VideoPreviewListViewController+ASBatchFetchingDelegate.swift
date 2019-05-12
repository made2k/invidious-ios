//
//  VideoPreviewListViewController+ASBatchFetchingDelegate.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit

extension VideoPreviewListViewController: ASBatchFetchingDelegate {

  func shouldFetchBatch(withRemainingTime remainingTime: TimeInterval, hint: Bool) -> Bool {
    guard hint == true else { return false }
    return model.canLoadMore
  }

}
