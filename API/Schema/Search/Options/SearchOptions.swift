//
//  SearchOptions.swift
//  API
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire

public struct SearchOptions {
  public let sort: SearchSort?
  public let date: SearchTiming?
  public let duration: SearchDuration?
  public let type: SearchType?
  public let features: [SearchFeature]
  
  internal init(sort: SearchSort?,
                date: SearchTiming?,
                duration: SearchDuration?,
                type: SearchType?,
                features: [SearchFeature]) {
    
    self.sort = sort
    self.date = date
    self.duration = duration
    self.type = type
    self.features = features
  }
  
  internal func apply(parameters: inout Parameters) {
    parameters["sort_by"] = sort?.rawValue
    parameters["date"] = date?.rawValue
    parameters["duration"] = duration?.rawValue
    parameters["type"] = type?.rawValue
    
    if features.isEmpty == false {
      parameters["features"] = features.map { $0.rawValue }.joined(separator: ",")
    }
  }
  
}
