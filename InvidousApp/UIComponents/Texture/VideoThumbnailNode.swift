//
//  VideoThumbnailNode.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import AsyncDisplayKit

class VideoThumbnailNode: ASNetworkImageNode {

  private let thumbnails: [VideoThumbnail]

  override var frame: CGRect {
    didSet {
      guard bounds != oldValue else { return }
      applyBestFittingImage(size: frame.size)
    }
  }

  init(thumbnails: [VideoThumbnail]) {
    self.thumbnails = thumbnails

    let downloader = ASPINRemoteImageDownloader.shared()
    super.init(cache: downloader, downloader: downloader)
  }

  private func applyBestFittingImage(size: CGSize) {
    guard size != .zero else { return }

    var closestDifference = CGFloat.greatestFiniteMagnitude
    var closestMatch: VideoThumbnail?

    for thumbnail in thumbnails {

      let difference = abs(thumbnail.size.width - size.width)
      if difference < closestDifference {
        closestMatch = thumbnail
        closestDifference = difference
      }

    }

    url = closestMatch?.url
  }

}
