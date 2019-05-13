//
//  NotSignedInCoordinator+SignInWebViewViewControllerDelegate.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/13/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

extension NotSignedInCoordinator: SignInWebViewViewControllerDelegate {

  func didSignInWithToken(sid: String) {
    Backend.shared.setToken(sid)
  }

}
