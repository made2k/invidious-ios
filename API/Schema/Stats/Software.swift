//
//  Software.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper
import Version

public struct Software: ImmutableMappable  {

  public let branch: String
  public let name: String
  public let version: Version

  public init(map: Map) throws {
    branch = try map.value("name")
    name = try map.value("name")
    version = try map.value("version", using: VersionTransform())
  }

}
