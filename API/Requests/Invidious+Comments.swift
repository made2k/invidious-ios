//
//  Invidious+Comments.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import PromiseKit

public extension Invidious {

  func getComments(videoId: String,
                   sort: CommentSort? = nil,
                   source: CommentSource? = nil,
                   continuation: String? = nil) -> Promise<CommentTree> {

    let url = baseInstance.appendingPathComponent("api/v1/comments/\(videoId)")

    var parameters: Parameters = [:]
    parameters["sort_by"] = sort?.rawValue
    parameters["source"] = source?.rawValue
    parameters["continuation"] = continuation

    return Alamofire.request(url, parameters: parameters).responseDecodable()
  }


}
