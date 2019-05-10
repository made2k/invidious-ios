//
//  Playlist.swift
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
public struct Playlist: ImmutableMappable {
  
  public let title: String
  public let playlistId: String
  public let author: String
  public let authorId: String
  public let authorUrl: String
  public let videoCount: UInt
  public let videos: [VideoSnippet]
  
  public init(map: Map) throws {
    title = try map.value("title")
    playlistId = try map.value("playlistId")
    author = try map.value("author")
    authorId = try map.value("authorId")
    authorUrl = try map.value("authorUrl")
    videoCount = try map.value("videoCount")
    videos = try map.value("videos")
  }
  
}
