//
//  Video.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct Video: ImmutableMappable {

  public let title: String
  public let videoId: String
  public let videoThumbnails: [VideoThumbnail]

  public let videoDescription: String
  public let videoDescriptionHtml: String
  public let published: Date
  public let publishedText: String

  public let keywords: [String]
  public let viewCount: UInt
  public let likeCount: UInt
  public let dislikeCount: UInt

  public let paid: Bool
  public let premium: Bool
  public let familyFriendly: Bool
  public let allowedRegions: [String]
  public let genre: String // TODO: List of genres?
  public let genreUrl: URL

  public let author: String
  public let authorId: String
  public let authorUrl: URL
  public let authorThumbnails: [AuthorThumbnail]

  public let subCountText: String
  public let length: TimeInterval
  public let allowsRatings: Bool
  public let rating: CGFloat
  public let isListed: Bool
  public let liveNow: Bool
  public let isUpcoming: Bool
  public let premierTime: Date?

  public let hlsUrl: URL?
  public let adaptiveFormats: [AdaptiveFormat]
  public let formatStreams: [FormatStream]
  public let captions: [Caption]
  public let recommendedVideos: [RecommendedVideo]

  public init(map: Map) throws {

    title = try map.value("title")
    videoId = try map.value("videoId")
    videoThumbnails = try map.value("videoThumbnails")

    videoDescription = try map.value("description")
    videoDescriptionHtml = try map.value("descriptionHtml")
    published = try map.value("published", using: DateTransform())
    publishedText = try map.value("publishedText")

    keywords = try map.value("keywords")
    viewCount = try map.value("viewCount")
    likeCount = try map.value("likeCount")
    dislikeCount = try map.value("dislikeCount")

    paid = try map.value("paid")
    premium = try map.value("premium")
    familyFriendly = try map.value("isFamilyFriendly")
    allowedRegions = try map.value("allowedRegions")
    genre = try map.value("genre")
    genreUrl = try map.value("genreUrl", using: URLTransform())

    author = try map.value("author")
    authorId = try map.value("authorId")
    authorUrl = try map.value("authorUrl", using: URLTransform())
    authorThumbnails = try map.value("authorThumbnails")

    subCountText = try map.value("subCountText")
    length = try map.value("lengthSeconds")
    allowsRatings = try map.value("allowRatings")
    rating = try map.value("rating")
    isListed = try map.value("isListed")
    liveNow = try map.value("liveNow")
    isUpcoming = try map.value("isUpcoming")
    premierTime = try? map.value("PremiereTimestamp")

    hlsUrl = try? map.value("hlsUrl", using: URLTransform())
    adaptiveFormats = try map.value("adaptiveFormats")
    formatStreams = try map.value("formatStreams")
    captions = try map.value("captions")
    recommendedVideos = try map.value("recommendedVideos")

  }

}

