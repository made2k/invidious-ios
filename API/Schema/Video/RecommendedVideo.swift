//
//  RecommendedVideo.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

/**
 Provides very little information about a video.
 Only the main details needed to display basic information
 is provided.
 */
public struct RecommendedVideo: ImmutableMappable {
  
  public let videoId: String
  public let title: String
  public let videoThumbnails: [VideoThumbnail]
  public let author: String
  public let length: TimeInterval
  public let viewCountText: String
  
  public init(map: Map) throws {
    
    videoId = try map.value("videoId")
    title = try map.value("title")
    videoThumbnails = try map.value("videoThumbnails")
    author = try map.value("author")
    length = try map.value("lengthSeconds")
    viewCountText = try map.value("viewCountText")
    
  }
  
}
