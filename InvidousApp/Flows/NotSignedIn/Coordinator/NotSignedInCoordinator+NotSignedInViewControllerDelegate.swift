//
//  NotSignedInCoordinator+NotSignedInViewControllerDelegate.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//


extension NotSignedInCoordinator: NotSignedInViewControllerDelegate {

  func signInButtonPressed() {

    let instanceUrl = Backend.shared.api.baseInstance

    let signInController = SignInWebViewViewController(baseUrl: instanceUrl, delegate: self)

    navigation.pushViewController(signInController, animated: true)
  }

}
