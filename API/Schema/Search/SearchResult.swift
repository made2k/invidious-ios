//
//  SearchResult.swift
//  API
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

public protocol SearchResult { }

extension ChannelPreview: SearchResult { }
extension Playlist: SearchResult { }
extension VideoPreview: SearchResult { }
