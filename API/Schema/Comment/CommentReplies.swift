//
//  CommentReplies.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct CommentReplies: ImmutableMappable {

  public let replyCount: UInt
  public let continuation: String

  public init(map: Map) throws {
    replyCount = try map.value("replyCount")
    continuation = try map.value("continuation")
  }

}
