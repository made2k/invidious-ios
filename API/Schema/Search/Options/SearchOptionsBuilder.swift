//
//  SearchOptionsBuilder.swift
//  API
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

public class SearchOptionBuilder {
  
  private var sort: SearchSort?
  private var date: SearchTiming?
  private var duration: SearchDuration?
  private var type: SearchType?
  private var features: [SearchFeature] = []
  
  public init() { }
  
  public func setSort(_ sort: SearchSort) -> SearchOptionBuilder {
    self.sort = sort
    return self
  }
  
  public func setTiming(_ timing: SearchTiming) -> SearchOptionBuilder {
    self.date = timing
    return self
  }
  
  public func setDuration(_ duration: SearchDuration) -> SearchOptionBuilder {
    self.duration = duration
    return self
  }
  
  public func setType(_ type: SearchType) -> SearchOptionBuilder {
    self.type = type
    return self
  }
  
  public func setFeatures(_ features: [SearchFeature]) -> SearchOptionBuilder {
    self.features = features
    return self
  }
  
  public func build() -> SearchOptions {
    return SearchOptions(sort: sort, date: date, duration: duration, type: type, features: features)
  }
  
}
