//
//  ServerStats.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper
import Version

public struct Statistic: ImmutableMappable {

  public let version: Version
  public let software: Software
  public let openRegistrations: Bool
  public let usage: Usage
  public let metadata: Metadata

  public init(map: Map) throws {
    version = try map.value("version", using: VersionTransform())
    software = try map.value("software")
    openRegistrations = try map.value("openRegistrations")
    usage = try map.value("usage")
    metadata = try map.value("metadata")
  }

}
