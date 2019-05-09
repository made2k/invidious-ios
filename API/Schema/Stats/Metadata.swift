//
//  Metadata.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Metadata: ImmutableMappable {

  public let updated: Date
  public let lastChannelRefreshed: Date

  public init(map: Map) throws {
    updated = try map.value("updatedAt", using: DateTransform())
    lastChannelRefreshed = try map.value("lastChannelRefreshedAt", using: DateTransform())
  }

}
