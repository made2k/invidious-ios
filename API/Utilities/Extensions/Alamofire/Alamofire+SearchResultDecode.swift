//
//  Alamofire+SearchResultDecode.swift
//  API
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import PromiseKit
import ObjectMapper

extension DataRequest {
  
  func responseSearchDecodable(queue: DispatchQueue? = nil) -> Promise<[SearchResult]> {
    
    return Promise { seal in
      
      validate(statusCode: 200..<400)
      responseJSON { response in
        
        switch response.result {
        case .success(let value):
          guard let jsonValue = value as? [[String: Any]] else {
            let error = MapError(key: nil, currentValue: nil, reason: nil)
            return seal.reject(error)
          }
          
          do {
            let results = try self.parseSearchResults(json: jsonValue)
            seal.fulfill(results)
            
          } catch {
            seal.reject(error)
          }
          
        case .failure(let error):
          seal.reject(error)
        }
        
      }
      
    }
    
  }
  
  private func parseSearchResults(json: [[String: Any]]) throws -> [SearchResult] {
    
    var parsedResults: [SearchResult] = []
    
    for value in json {
      guard let type = value["type"] as? String else { continue }
      
      switch type {
      case "video":
        let video = try VideoPreview(JSON: value)
        parsedResults.append(video)
        
      case "playlist":
        let playlist = try Playlist(JSON: value)
        parsedResults.append(playlist)
        
      case "channel":
        let channel = try ChannelPreview(JSON: value)
        parsedResults.append(channel)
        
      default:
        continue
      }
      
    }
    
    return parsedResults
  }
  
}
