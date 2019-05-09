//
//  Caption.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct Caption: ImmutableMappable {

  public let label: String
  public let languageCode: String
  public let url: URL

  public init(map: Map) throws {
    label = try map.value("label")
    languageCode = try map.value("languageCode")
    url = try map.value("url", using: URLTransform())
  }

}
