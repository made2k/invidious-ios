//
//  VideoPreviewModel.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/13/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import PromiseKit

protocol VideoPreviewModel {

  var videos: [VideoPreview] { get }
  var canLoadMore: Bool { get }

  func loadVideos() -> Promise<[VideoPreview]>

}
