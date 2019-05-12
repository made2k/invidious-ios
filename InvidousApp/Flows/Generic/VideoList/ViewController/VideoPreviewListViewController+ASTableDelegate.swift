//
//  VideoPreviewListViewController+ASTableDelegate.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit
import PromiseKit
import Toaster

extension VideoPreviewListViewController: ASTableDelegate {

  func tableNode(_ tableNode: ASTableNode, willBeginBatchFetchWith context: ASBatchContext) {

    let startingDataCount = model.videos.count

    firstly {
      model.loadVideos()

    }.done {
      self.insertIntoTable(tableNode, startingIndex: startingDataCount, newVideoCount: $0.count)

    }.done {
      context.completeBatchFetching(true)

    }.catch { error in
      Toast(text: R.string.videoPreviewList.errorLoadingVideos(), duration: Delay.short).show()
      context.completeBatchFetching(false)
    }

  }

}

private extension VideoPreviewListViewController {

  private func insertIntoTable(_ tableNode: ASTableNode, startingIndex: Int, newVideoCount: Int) {

    guard newVideoCount > 0 else { return }

    let indexToInsert = (0..<newVideoCount)
      .map { IndexPath(row: $0 + startingIndex, section: 0) }

    tableNode.insertRows(at: indexToInsert, with: .automatic)

  }

}
