//
//  Invidious+Videos.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import PromiseKit

public extension Invidious {
  
  func getVideo(videoId: String) -> Promise<Video> {
    let url = baseInstance.appendingPathComponent("api/v1/videos/\(videoId)")
    return Alamofire.request(url).responseDecodable()
  }
  
  func getTopVideos() -> Promise<[VideoPreview]> {
    let url = baseInstance.appendingPathComponent("api/v1/top")
    return Alamofire.request(url).responseArrayDecodable()
  }
  
  func getTrendingVideos(genre: Genre?) -> Promise<[VideoPreview]> {
    let url = baseInstance.appendingPathComponent("api/v1/trending")
    
    var parameters: Parameters = [:]
    if let genre = genre {
      parameters["type"] = genre.rawValue
    }
    
    return Alamofire.request(url, method: .get, parameters: parameters).responseArrayDecodable()
  }
  
}
