//
//  SubscriptionVideoListModel.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/13/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import Foundation
import PromiseKit

final class SubscriptionVideoListModel: NSObject, VideoPreviewModel {

  private(set) var videos: [VideoPreview] = []

  private var hasAttemptedLoad = false
  private var requestReturnedNoValues = false

  var canLoadMore: Bool {
    return hasAttemptedLoad == false || requestReturnedNoValues == true
  }

  private var api: Invidious { return Backend.shared.api }

  private var subscriptionRefreshPromise: Promise<[Subscription]>?
  private var videoRefreshPromise: Promise<[VideoPreview]>?

  private func refreshSubscriptions() -> Promise<[Subscription]> {
    return Backend.shared.api.getSubscriptions()
  }

  func refreshVideos(includeSubscriptions: Bool = false) -> Promise<[VideoPreview]> {

    guard canLoadMore == true else { return .value([]) }

    if let existing = videoRefreshPromise, existing.isPending {
      return existing
    }

    hasAttemptedLoad = true

    let subscriptionPromise: Promise<[Subscription]>

    if let promise = subscriptionRefreshPromise {

      if includeSubscriptions && promise.isPending == false {
        subscriptionPromise = refreshSubscriptions()

      } else {
        subscriptionPromise = promise
      }

    } else {
      subscriptionPromise = refreshSubscriptions()
    }

    self.subscriptionRefreshPromise = subscriptionPromise

    return firstly {
      subscriptionPromise

    }.then { subscriptions -> Promise<[[VideoPreview]]> in
      let videoPromies: [Promise<[VideoPreview]>] = subscriptions.map { self.api.getChannelVideos(channelId: $0.authorId, page: 0, sort: .newest) }
      return when(fulfilled: videoPromies)

    }.flatMapValues {
      return $0

    }.map { videos -> [VideoPreview] in
      return videos.sorted(by: { $0.published > $1.published })

    }.get {
      self.videos = $0

    }.get {
      self.requestReturnedNoValues = $0.isEmpty
    }

  }

  func loadVideos() -> Promise<[VideoPreview]> {
    return refreshVideos()
  }

}
