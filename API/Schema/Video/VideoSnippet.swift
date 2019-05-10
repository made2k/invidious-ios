//
//  VideoSnippet.swift
//  API
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

/**
 Ligh weight struct representing a video with very
 limited information.
 */
public struct VideoSnippet: ImmutableMappable {
  
  public let title: String
  public let videoId: String
  public let length: TimeInterval
  public let videoThumbnails: [VideoThumbnail]
  
  public init(map: Map) throws {
    title = try map.value("title")
    videoId = try map.value("videoId")
    length = try map.value("lengthSeconds")
    videoThumbnails = try map.value("videoThumbnails")
  }
  
}
