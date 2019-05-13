//
//  Backend.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import Foundation
import RxRelay
import RxSwift

final class Backend: NSObject {

  static let shared = Backend()

  private let apiRelay: BehaviorRelay<Invidious>
  var api: Invidious { return apiRelay.value }

  private var authTokenRelay = BehaviorRelay<String?>(value: nil)

  private let isUserSignedInRelay = BehaviorRelay<Bool>(value: false)
  var isUserSignedInObserver: Observable<Bool> { return isUserSignedInRelay.asObservable() }
  var isUserSignedIn: Bool { return isUserSignedInRelay.value }

  private let disposeBag = DisposeBag()

  private override init() {
    let instance = Invidious(instance: ApplicationSettings.shared.invidiousInstance.value)
    self.apiRelay = BehaviorRelay<Invidious>(value: instance)

    super.init()

    setupBindings()
  }

  private func setupBindings() {

    ApplicationSettings.shared.invidiousInstance
      .map { Invidious(instance: $0) }
      .bind(to: apiRelay)
      .disposed(by: disposeBag)

    apiRelay
      .map { Auth.shared.token(for: $0.baseInstance) }
      .bind(to: authTokenRelay)
      .disposed(by: disposeBag)

    authTokenRelay
      .map { $0 != nil }
      .bind(to: isUserSignedInRelay)
      .disposed(by: disposeBag)

    let newAuthToken = authTokenRelay
      .skip(1)
      .share(replay: 1)

    newAuthToken
      .subscribe(onNext: { [unowned self] in
        self.api.setToken(token: $0)
      }).disposed(by: disposeBag)

    newAuthToken
      .subscribe(onNext: {
        if let token = $0 {
          Auth.shared.setToken(token, for: self.api.baseInstance)
        } else {
          Auth.shared.deleteToken(for: self.api.baseInstance)
        }
      }).disposed(by: disposeBag)

  }

  func setToken(_ token: String?) {
    authTokenRelay.accept(token)
  }

}
