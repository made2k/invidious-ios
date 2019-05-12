//
//  VideoPreviewCellNode.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import AsyncDisplayKit
import MaterialComponents
import Then

class VideoPreviewCellNode: ASCellNode {

  private let videoThumbnailNode: VideoThumbnailNode
  private let authorThumbnailNode: AuthorThumbnailNode
  private let titleNode = TextNode().then {
    $0.font = MDCTypography.body1Font().withSize(16)
  }
  private let detailNode = TextNode().then {
    $0.font = MDCTypography.body1Font().withSize(13)
    $0.textColor = UIColor.darkGray
  }

  init(_ videoPreview: VideoPreview) {

    videoThumbnailNode = VideoThumbnailNode(thumbnails: videoPreview.videoThumbnails)
    authorThumbnailNode = AuthorThumbnailNode(authorId: videoPreview.authorId)

    titleNode.text = videoPreview.title
    detailNode.text = "\(videoPreview.author) • \(videoPreview.viewCount.suffixDescription) views • \(videoPreview.publishedText)"

    super.init()

    automaticallyManagesSubnodes = true
    selectionStyle = .none
  }

  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

    let thumbnailRatioSpec = ASRatioLayoutSpec(ratio: 9/16, child: videoThumbnailNode)

    let verticalTextSpec = ASStackLayoutSpec.vertical()
    verticalTextSpec.children = [titleNode, detailNode]
    verticalTextSpec.spacing = 4
    verticalTextSpec.style.flexShrink = 1

    let authorTextSpec = ASStackLayoutSpec.horizontal()
    authorTextSpec.children = [authorThumbnailNode, verticalTextSpec]
    authorTextSpec.spacing = 8

    let detailInsetSpec = ASInsetLayoutSpec()
    detailInsetSpec.child = authorTextSpec
    detailInsetSpec.insets = UIEdgeInsets(top: 16, left: 16, bottom: 24, right: 16)

    let contentStackSpec = ASStackLayoutSpec.vertical()
    contentStackSpec.children = [thumbnailRatioSpec, detailInsetSpec]

    return contentStackSpec

  }

}

