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

extension VideoPreviewListViewController: ASCollectionDelegate {

  func collectionNode(_ collectionNode: ASCollectionNode, willBeginBatchFetchWith context: ASBatchContext) {

    let startingDataCount = model.videos.count

    firstly {
      model.loadVideos()

    }.done {
      self.insertInto(collectionNode, startingIndex: startingDataCount, newVideoCount: $0.count)

    }.done {
      context.completeBatchFetching(true)

    }.catch { error in
      Toast(text: R.string.videoPreviewList.errorLoadingVideos(), duration: Delay.short).show()
      context.completeBatchFetching(false)
    }

  }

  func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {

    let collectionWidth = collectionNode.frame.width - sectionInsets.left - sectionInsets.right
    let numberOfSpacers = numberOfColumns - 1

    let minSize = CGSize(width: minColumnWidth, height: .zero)

    let maxWidth = (collectionWidth / CGFloat(numberOfColumns)) - (minimumInterimSpacing * CGFloat(numberOfSpacers))
    let maxSize = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)

    return ASSizeRange(min: minSize, max: maxSize)
  }

}


private extension VideoPreviewListViewController {

  private func insertInto(_ collectionNode: ASCollectionNode, startingIndex: Int, newVideoCount: Int) {

    guard newVideoCount > 0 else { return }

    let indexToInsert = (0..<newVideoCount)
      .map { IndexPath(row: $0 + startingIndex, section: 0) }

    collectionNode.insertItems(at: indexToInsert)

  }

}
