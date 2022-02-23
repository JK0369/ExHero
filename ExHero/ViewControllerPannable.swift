//
//  ViewControllerPannable.swift
//  ExHero
//
//  Created by Jake.K on 2022/02/23.
//

import UIKit
import Hero

class ViewControllerPannable: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1
    self.isHeroEnabled = true
    
    let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
    self.view.addGestureRecognizer(panGestureRecognizer)
  }
  
  @objc func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
    self.rightToLeftSwipeBackToDismiss(panGesture)
  }
  
  // in rightToLeftSwipeBackToDismiss(_:)
  private func rightToLeftSwipeBackToDismiss(_ panGesture: UIPanGestureRecognizer) {
    // translation: 처음 클릭한 부분으로부터 얼마만큼 좌표가 이동된지 변화량 값
    let translation = panGesture.translation(in: nil)
    // progressRate: 전체 width중에 얼마만큼 이동되었는지 비율
    let progressRate = -translation.x / view.bounds.width
    
    switch panGesture.state {
    case .began:
      // 2
      self.hero.dismissViewController()
    case .changed:
      // 3
      Hero.shared.update(progressRate)
      Hero.shared.apply(modifiers: [.translate(x: translation.x)], to: self.view)
      break
    default:
      // 4
      if progressRate > 0.3 {
        Hero.shared.finish()
      } else {
        Hero.shared.cancel()
      }
    }
  }
}

