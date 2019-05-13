//
//  WKHTTPCookieStore+Promise.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/13/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import PromiseKit
import WebKit

extension WKHTTPCookieStore {

  func delete(_ :PMKNamespacer, cookie: HTTPCookie) -> Guarantee<Void> {

    return Guarantee { seal in

      self.delete(cookie) {
        seal(())
      }

    }

  }

}
