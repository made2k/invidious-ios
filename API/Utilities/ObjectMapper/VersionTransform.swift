//
//  VersionTransform.swift
//  API
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper
import Version

final class VersionTransform: TransformType {

  typealias Object = Version
  typealias JSON = String

  func transformFromJSON(_ value: Any?) -> Version? {
    guard let value = value as? String else { return nil }
    return Version(stringLiteral: value)
  }

  func transformToJSON(_ value: Version?) -> String? {
    return value?.description
  }

}
