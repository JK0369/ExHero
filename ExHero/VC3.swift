//
//  VC3.swift
//  ExHero
//
//  Created by Jake.K on 2022/02/24.
//

import UIKit

class VC3: UIViewController {
  private let dismissButton: UIButton = {
    let button = UIButton()
    button.setTitle("dismiss", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBlue
    
    self.view.addSubview(self.dismissButton)
    self.dismissButton.translatesAutoresizingMaskIntoConstraints = false
    self.dismissButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    self.dismissButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    self.dismissButton.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
  }
  
  @objc private func didTapDismissButton() {
    self.dismiss(animated: true)
  }
}
