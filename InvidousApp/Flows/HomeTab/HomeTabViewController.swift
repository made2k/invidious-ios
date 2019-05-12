//
//  HomeTabViewController.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/10/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import MaterialComponents
import UIKit

class HomeTabViewController: MDCTabBarViewController {
  
  // MARK: - Initialization
  
  init(viewControllers: [UIViewController]) {
    super.init(nibName: nil, bundle: nil)
    self.viewControllers = viewControllers
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let tabBar = tabBar {
      setupTabBar(tabBar)
    }
    
    selectedViewController = viewControllers.first
  }
  
  // MARK: - View Contiguration
  
  private func setupTabBar(_ tabBar: MDCTabBar) {
    tabBar.backgroundColor = .white
    tabBar.tintColor = .youtubeRed
    tabBar.selectedItemTintColor = .youtubeRed
    tabBar.inkColor = UIColor.youtubeRed.withAlphaComponent(0.2)
    
    tabBar.unselectedItemTintColor = .youtubeAlmostBlack
  }
  
}
