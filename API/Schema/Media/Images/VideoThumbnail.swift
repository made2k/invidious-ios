//
//  VideoThumbnail.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct VideoThumbnail: ImmutableMappable {

  public let quality: String // TODO: Quality enum?
  public let url: URL
  public let size: CGSize

  public init(map: Map) throws {

    quality = try map.value("quality")
    url = try map.value("url", using: URLTransform())

    let width: Int = try map.value("width")
    let height: Int = try map.value("height")
    size = CGSize(width: width, height: height)

  }

}
