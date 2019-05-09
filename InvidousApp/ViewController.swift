//
//  ViewController.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/8/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import API
import UIKit

class ViewController: UIViewController {
  
  let api = Invidious(instance: URL(string: "https://invidio.us").unsafelyUnwrapped)

  // TODO: This is simply just a sample now to work with the API.
  override func viewDidLoad() {
    super.viewDidLoad()
    
    api.getSubscriptions().done { value in
      print(value)
    }.catch { error in
      print(error)
    }

  }


}

