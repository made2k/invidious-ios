//
//  Invidios+Subscriptions.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import PromiseKit

public extension Invidious {
  
  func getSubscriptions() -> Promise<[Subscription]> {
    let url = baseInstance.appendingPathComponent("api/v1/auth/subscriptions")
    return Alamofire.request(url).responseArrayDecodable()
  }
  
}
