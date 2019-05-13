//
//  SignInWebViewViewControllerDelegate.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/13/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

protocol SignInWebViewViewControllerDelegate: class {
  func didSignInWithToken(sid: String)
}
