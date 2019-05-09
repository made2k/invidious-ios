//
//  Invidious.swift
//  API
//
//  Created by Zach McGaughey on 5/9/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Alamofire
import Foundation

public final class Invidious: NSObject {
  
  internal let baseInstance: URL
  internal var authToken: String?
  
  public init(instance: URL) {
    baseInstance = instance
  }
  
  public func setToken(token: String?) {
    
    guard let cookieStorage = Alamofire.SessionManager.default.session.configuration.httpCookieStorage else { return }
    
    guard let token = token else {
      
      for cookie in cookieStorage.cookies ?? [] {
        cookieStorage.deleteCookie(cookie)
      }
      return
    }
    
    let cookieHeaderField = ["Set-Cookie": "SID=\(token)"]
    let cookies = HTTPCookie.cookies(withResponseHeaderFields: cookieHeaderField, for: baseInstance)
    
    cookieStorage.setCookies(cookies, for: baseInstance, mainDocumentURL: nil)
  }
  
}
