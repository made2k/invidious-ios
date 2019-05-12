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
  var api: Invidious {
    return apiRelay.value
  }

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

  }

}
