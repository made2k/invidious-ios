//
//  FormatStream.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct FormatStream: ImmutableMappable {

  public let url: URL
  public let itag: String
  public let type: String // TODO: Codec Type Enum?
  public let quality: String
  public let container: String
  public let encoding: String
  public let qualityLabel: String
  public let resolution: String
  public let size: CGSize

  public init(map: Map) throws {

    url = try map.value("url", using: URLTransform())
    itag = try map.value("itag")
    type = try map.value("type")
    quality = try map.value("quality")
    container = try map.value("container")
    encoding = try map.value("encoding")
    qualityLabel = try map.value("qualityLabel")
    resolution = try map.value("resolution")

    let jsonSize: String = try map.value("size")

    let comps = jsonSize.components(separatedBy: "x")
    guard comps.count == 2 else { throw MapError(key: nil, currentValue: nil, reason: nil) }

    guard let width = Int(comps[0]), let height = Int(comps[1]) else {
      throw MapError(key: nil, currentValue: nil, reason: nil)
    }

    size = CGSize(width: width, height: height)
  }

}
