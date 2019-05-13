//
//  Auth.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/13/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Foundation
import SAMKeychain

class Auth: NSObject {

  private let account = Bundle.main.bundleIdentifier ?? "invidious"

  static let shared = Auth()
  private override init() { }

  func token(for instance: URL) -> String? {
    guard let service = instance.host else { return nil }
    return SAMKeychain.password(forService: service, account: account)
  }

  func setToken(_ token: String, for instance: URL) {
    guard let service = instance.host else { return }
    SAMKeychain.setPassword(token, forService: service, account: account)
  }

  func deleteToken(for instance: URL) {
    guard let service = instance.host else { return }
    SAMKeychain.deletePassword(forService: service, account: account)
  }

}
