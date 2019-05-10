//
//  Invidious+Channels.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import PromiseKit

public extension Invidious {

  func getLatestChannelVideos(channelId: String) -> Promise<[VideoPreview]> {
    let url = baseInstance.appendingPathComponent("api/v1/channels/latest/\(channelId)")
    return Alamofire.request(url).responseArrayDecodable()
  }
  
  func getChannelVideos(channelId: String, page: UInt = 0, sort: ChannelSort? = nil) -> Promise<[VideoPreview]> {
    let url = baseInstance.appendingPathComponent("api/v1/channels/videos/\(channelId)")
    
    var parameters: Parameters = [:]
    parameters["sort_by"] = sort?.rawValue
    parameters["page"] = page
    
    return Alamofire.request(url, parameters: parameters).responseArrayDecodable()
  }
  
  func getChannelPlaylists(channelId: String, sort: ChannelPlaylistSort, continuation: String? = nil) -> Promise<ChannelPlaylist> {
    let url = baseInstance.appendingPathComponent("api/v1/channels/playlists/\(channelId)")
    
    var parameters: Parameters = [:]
    parameters["sort_by"] = sort.rawValue
    parameters["continuation"] = continuation
    
    return Alamofire.request(url, parameters: parameters).responseDecodable()
  }

  func getChannel(channelId: String, sort: ChannelSort? = nil) -> Promise<Channel> {
    let url = baseInstance.appendingPathComponent("api/v1/channels/\(channelId)")

    var parameters: Parameters = [:]
    parameters["sort_by"] = sort?.rawValue

    return Alamofire.request(url, parameters: parameters).responseDecodable()
  }

}
