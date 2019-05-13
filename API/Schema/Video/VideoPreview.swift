//
//  VideoPreview.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

/**
 Ligh weight struct representing a video with some
 information. This provides video thumbnails as well
 as information about the author and the video's
 description.
 */
public struct VideoPreview: ImmutableMappable {
  
  public let title: String
  public let videoId: String
  public let videoThumbnails: [VideoThumbnail]
  
  public let length: TimeInterval
  public let viewCount: UInt
  
  public let author: String
  public let authorId: String
  public let authorUrl: URL
  
  public let published: Date
  public let publishedText: String
  public let videoDescription: String
  public let videoDescriptionHtml: String
  
  public let liveNow: Bool?
  public let paid: Bool?
  public let premium: Bool?
  
  public init(map: Map) throws {
    
    title = try map.value("title")
    videoId = try map.value("videoId")
    videoThumbnails = try map.value("videoThumbnails")
    
    length = try map.value("lengthSeconds")
    viewCount = try map.value("viewCount")

    do {
      let test: String = try map.value("author")
    } catch {
      print("error")
    }
    
    author = try map.value("author")
    authorId = try map.value("authorId")
    authorUrl = try map.value("authorUrl", using: URLTransform())
    
    published = try map.value("published", using: DateTransform())
    publishedText = try map.value("publishedText")
    videoDescription = try map.value("description")
    videoDescriptionHtml = try map.value("descriptionHtml")
    
    liveNow = try? map.value("liveNow")
    paid = try? map.value("paid")
    premium = try? map.value("premium")
  }
  
}
