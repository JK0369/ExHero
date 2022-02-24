//
//  ViewController.swift
//  ExHero
//
//  Created by Jake.K on 2022/02/23.
//

import UIKit
import Hero

class ViewController: UIViewController {
  
  private lazy var vc3: VC3 = {
    let vc = VC3()
    vc.isHeroEnabled = true
    vc.modalPresentationStyle = .fullScreen
    return vc
  }()
  
  @IBAction func didTapButton(_ sender: Any) {
    let vc2 = VC2()
    vc2.modalPresentationStyle = .fullScreen
    self.present(vc2, animated: true)
  }
  @IBAction func didTapSelectBy(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .selectBy(presenting: .pull(direction: .left), dismissing: .slide(direction: .down))
    self.present(vc3, animated: true)
  }
  @IBAction func zoom(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .zoom
    self.present(vc3, animated: true)
  }
  @IBAction func zoomSlide(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .zoomSlide(direction: .up)
    self.present(vc3, animated: true)
  }
  @IBAction func pageIn(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .pageIn(direction: .left)
    self.present(vc3, animated: true)
  }
  @IBAction func pull(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .pull(direction: .left)
    self.present(vc3, animated: true)
  }
  @IBAction func autoReverse(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .autoReverse(presenting: .pageIn(direction: .left))
    self.present(vc3, animated: true)
  }
  @IBAction func fade(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .fade
    self.present(vc3, animated: true)
  }
  @IBAction func cover(_ sender: Any) {
    self.vc3.hero.modalAnimationType = .cover(direction: .down)
    self.present(vc3, animated: true)
  }
}
