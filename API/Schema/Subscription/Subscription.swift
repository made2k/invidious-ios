//
//  Subscription.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Subscription: ImmutableMappable {
  
  public let author: String
  public let authorId: String
  
  public init(map: Map) throws {
    author = try map.value("author")
    authorId = try map.value("authorId")
  }
  
}
