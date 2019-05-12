//
//  VideoListModel.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import Foundation
import PromiseKit

/**
 A model used to fetch and store VideoPreview objects.
 */
final class VideoListModel: NSObject {

  private let loader: VideoPreviewRequest
  private var continuation: String?

  private var hasAttemptedLoad = false
  private var requestReturnedNoValues = false

  var canLoadMore: Bool {
    return hasAttemptedLoad == false || (requestReturnedNoValues == false && continuation != nil)
  }

  private(set) var videos: [VideoPreview] = []

  init(loader: @escaping VideoPreviewRequest) {
    self.loader = loader
  }

  func loadVideos() -> Promise<[VideoPreview]> {

    guard canLoadMore == true else {
      return .value([])
    }

    return firstly {
      loader(continuation)

    }.get {
      self.videos.append(contentsOf: $0.0)
      self.continuation = $0.1
      self.hasAttemptedLoad = true
      self.requestReturnedNoValues = $0.0.isEmpty

    }.map {
      $0.0
    }

  }

}
