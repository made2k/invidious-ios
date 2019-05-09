//
//  AdaptiveFormat.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct AdaptiveFormat: ImmutableMappable {

  public let index: String
  public let bitrate: String
  public let `init`: String
  public let url: URL
  public let itag: String
  public let type: String // TODO: Codec Type Enum?
  public let clen: String
  public let lmd: String
  public let projectionType: Int
  public let container: String?
  public let encoding: String?
  public let qualityLabel: String?
  public let resolution: String?

  public init(map: Map) throws {

    index = try map.value("index")
    bitrate = try map.value("bitrate")
    `init` = try map.value("init")
    url = try map.value("url", using: URLTransform())
    itag = try map.value("itag")
    type = try map.value("type")
    clen = try map.value("clen")
    lmd = try map.value("lmt")
    let projectionString: String = try map.value("projectionType")
    if let intValue = Int(projectionString) {
      projectionType = intValue
    } else {
      throw MapError.init(key: "projectionType", currentValue: nil, reason: nil)
    }
    container = try? map.value("container")
    encoding = try? map.value("encoding")
    qualityLabel = try? map.value("qualityLabel")
    resolution = try? map.value("resolution")

  }

}
