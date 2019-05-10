//
//  Invidious+Search.swift
//  API
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import PromiseKit

public extension Invidious {

  func searchChannel(channelId: String, query: String, page: UInt = 0) -> Promise<[SearchResult]> {
    let url = baseInstance.appendingPathComponent("api/v1/channels/search/\(channelId)")
    
    var parameters: Parameters = [:]
    parameters["q"] = query
    parameters["page"] = page
    
    return Alamofire.request(url, parameters: parameters).responseSearchDecodable()
  }
  
  func search(query: String, page: UInt = 0, options: SearchOptions) -> Promise<[SearchResult]> {
    let url = baseInstance.appendingPathComponent("api/v1/search")
    
    var parameters: Parameters = [:]
    parameters["q"] = query
    parameters["page"] = page
    
    options.apply(parameters: &parameters)
    
    return Alamofire.request(url, parameters: parameters).responseSearchDecodable()
  }
  
}
