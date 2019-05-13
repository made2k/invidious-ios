//
//  NotSignedInViewController.swift
//  InvidousApp
//
//  Created by Zach McGaughey on 5/12/19.
//  Copyright © 2019 Zach McGaughey. All rights reserved.
//

import MaterialComponents
import RxCocoa
import RxSwift
import UIKit

class NotSignedInViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  @IBOutlet weak var signInButton: MDCButton!

  private weak var delegate: NotSignedInViewControllerDelegate?
  private let disposeBag = DisposeBag()

  init(delegate: NotSignedInViewControllerDelegate) {
    self.delegate = delegate
    
    let nib = R.nib.notSignedIn
    super.init(nibName: nib.name, bundle: nib.bundle)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    styleView()
    setupBindings()
  }

  private func setupBindings() {

    signInButton.rx.tap
      .subscribe(onNext: { [unowned self] in
        self.delegate?.signInButtonPressed()
      }).disposed(by: disposeBag)

  }

  private func styleView() {

    titleLabel.text = R.string.notSignedIn.signInTitle()
    titleLabel.font = MDCTypography.headlineFont()
    titleLabel.textColor = .youtubeAlmostBlack

    detailLabel.text = R.string.notSignedIn.signInDescription()
    detailLabel.font = MDCTypography.body1Font()
    detailLabel.textColor = .darkGray

    signInButton.setTitleColor(.white, for: .normal)
    signInButton.inkColor = UIColor.white.withAlphaComponent(0.2)
    signInButton.setBackgroundColor(.youtubeBlue, for: .normal)
    signInButton.setTitleFont(MDCTypography.buttonFont().withSize(16), for: .normal)
    signInButton.setTitle(R.string.notSignedIn.signInButton(), for: .normal)
  }
  

}
