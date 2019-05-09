//
//  Usage.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct Usage: ImmutableMappable {

  public let total: UInt
  public let activeHalfYear: UInt
  public let activeMonth: UInt

  public init(map: Map) throws {
    total = try map.value("users.total")
    activeHalfYear = try map.value("users.activeHalfyear")
    activeMonth = try map.value("users.activeMonth")
  }

}
