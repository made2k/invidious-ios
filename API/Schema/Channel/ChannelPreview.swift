//
//  ChannelPreview.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct ChannelPreview: ImmutableMappable {

  public let author: String
  public let authorId: String
  public let authorUrl: URL
  public let authorThumbnails: [AuthorThumbnail]

  public init(map: Map) throws {
    author = try map.value("author")
    authorId = try map.value("authorId")
    authorUrl = try map.value("authorUrl", using: URLTransform())
    authorThumbnails = try map.value("authorThumbnails")
  }

}
