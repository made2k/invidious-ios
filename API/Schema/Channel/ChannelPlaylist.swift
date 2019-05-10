//
//  ChannelPlaylist.swift
//  API
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import ObjectMapper

public struct ChannelPlaylist: ImmutableMappable {
  
  public let playlists: [Playlist]
  public let continuation: String?
  
  public init(map: Map) throws {
    playlists = try map.value("playlists")
    continuation = try? map.value("continuation")
  }
  
}
