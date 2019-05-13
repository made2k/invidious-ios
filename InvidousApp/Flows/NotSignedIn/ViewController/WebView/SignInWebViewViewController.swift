//
//  SignInWebViewViewController.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import PromiseKit
import UIKit
import WebKit

class SignInWebViewViewController: UIViewController {

  private let configuration: WKWebViewConfiguration
  private lazy var webview: WKWebView = {
    let webview = WKWebView(frame: .zero, configuration: configuration)
    webview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    return webview
  }()

  private let baseUrl: URL
  private weak var delegate: SignInWebViewViewControllerDelegate?

  init(baseUrl: URL, delegate: SignInWebViewViewControllerDelegate) {
    self.baseUrl = baseUrl
    self.delegate = delegate

    self.configuration = WKWebViewConfiguration()

    super.init(nibName: nil, bundle: nil)

    configuration.websiteDataStore.httpCookieStore.add(self)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    webview.frame = view.bounds
    view.addSubview(webview)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadLoginPage()
  }

  private func loadLoginPage() {
    let loginUrl = ApplicationSettings.shared.invidiousInstance.value.appendingPathComponent("login")
    let request = URLRequest(url: loginUrl)
    webview.load(request)
  }

}

extension SignInWebViewViewController: WKHTTPCookieStoreObserver {

  func cookiesDidChange(in cookieStore: WKHTTPCookieStore) {

    cookieStore.getAllCookies { [unowned self] cookies in

      let newSid = cookies
        .filter { $0.name == "SID" }
        .first?
        .value
        .removingPercentEncoding

      guard let sid = newSid else { return }

      cookieStore.remove(self)

      self.clearCookies(store: cookieStore, cookies: cookies).done {
        self.delegate?.didSignInWithToken(sid: sid)
      }
    }
  }

  private func clearCookies(store: WKHTTPCookieStore, cookies: [HTTPCookie]) -> Guarantee<Void> {

    let guarantees = cookies.map {
      store.delete(.promise, cookie: $0)
    }

    return when(guarantees: guarantees)
  }

}
