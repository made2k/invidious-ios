//
//  AuthorThumbnailNode.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/11/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import AsyncDisplayKit

// TODO: When author is known, lookup cache for image or fetch author image.
class AuthorThumbnailNode: ASNetworkImageNode {

  private let authorId: String

  override var frame: CGRect {
    didSet {
      let minSide = min(frame.size.height, frame.size.width)
      cornerRadius = minSide / 2
    }
  }

  init(authorId: String) {
    self.authorId = authorId

    let downloader = ASPINRemoteImageDownloader.shared()
    super.init(cache: downloader, downloader: downloader)

    self.defaultImage = R.image.defaultAvatar()
    self.imageModificationBlock = ASImageNodeTintColorModificationBlock(.youtubeAlmostBlack)
    self.style.preferredSize = CGSize(width: 36, height: 36)
  }

}
