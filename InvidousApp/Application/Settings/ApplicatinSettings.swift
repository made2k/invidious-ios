//
//  ApplicatinSettings.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

final class ApplicatinSettings: NSObject {
  
  // MARK: - Static
  
  static let shared = ApplicatinSettings()
  
  private static func registerDefaults() {
    
    UserDefaults.standard.register(defaults: [
      Keys.invidiousInstanceKey: URL(string: "https://invidio.us").unsafelyUnwrapped
      ])
  }
  
  private struct Keys {
    static let invidiousInstanceKey = "com.invidios.settings.invidiousInstanceKey"
  }
  
  // MARK: - Properties
  
  private let defaults = UserDefaults.standard
  private let disposeBag = DisposeBag()
  
  let invidiousInstance: BehaviorRelay<URL?>
  
  // MARK: - Initialization
  
  func configure() { }

  private override init() {
    ApplicatinSettings.registerDefaults()
    invidiousInstance = BehaviorRelay<URL?>(value: defaults.url(forKey: Keys.invidiousInstanceKey))

    super.init()
    
    setupBindings()
  }
  
  // MARK: - Bindings
  
  private func setupBindings() {
    
    let defaults = self.defaults

    Observable.combineLatest(invidiousInstance, Observable.just(Keys.invidiousInstanceKey))
      .skip(1)
      .subscribe(onNext: {
        $0.0 != nil ?
          defaults.set($0.0, forKey: $0.1) :
          defaults.removeObject(forKey: $0.1)
      }).disposed(by: disposeBag)
    
  }

}
