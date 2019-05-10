//
//  Comment.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct Comment: ImmutableMappable {

  public let author: String
  public let authorThumbnails: [AuthorThumbnail]
  public let authorId: String
  public let authorUrl: URL
  public let isEdited: Bool
  public let content: String
  public let contentHtml: String
  public let published: Date
  public let publishedText: String
  public let likeCount: UInt
  public let commentId: String
  public let authorIsChannelOwner: Bool
  // public let creatorHeart: {} // TODO: What is this?
  public let replies: CommentReplies?



  public init(map: Map) throws {
    author = try map.value("author")
    authorThumbnails = try map.value("authorThumbnails")
    authorId = try map.value("authorId")
    authorUrl = try map.value("authorUrl", using: URLTransform())
    isEdited = try map.value("isEdited")
    content = try map.value("content")
    contentHtml = try map.value("contentHtml")
    published = try map.value("published", using: DateTransform())
    publishedText = try map.value("publishedText")
    likeCount = try map.value("likeCount")
    commentId = try map.value("commentId")
    authorIsChannelOwner = try map.value("authorIsChannelOwner")
    replies = try? map.value("replies")
  }

}
