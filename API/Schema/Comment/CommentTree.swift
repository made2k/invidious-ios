//
//  CommentTree.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct CommentTree: ImmutableMappable {

  public let commentCount: UInt?
  public let videoId: String
  public let comments: [Comment]
  public let continuation: String?

  public init(map: Map) throws {
    commentCount = try? map.value("commentCount")
    videoId = try map.value("videoId")
    comments = try map.value("comments")
    continuation = try? map.value("continuation")
  }

}
