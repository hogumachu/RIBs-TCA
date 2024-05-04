//
//  View+Attach.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import UIKit
import SwiftUI

extension View {
  
  // 출처: https://minsone.github.io/swiftui-ribs
  
  func attach(to parentViewController: UIViewController) {
    let contentVC = UIHostingController(rootView: self)
    let parentVC = parentViewController
    
    parentVC.addChild(contentVC)
    contentVC.view.translatesAutoresizingMaskIntoConstraints = false
    parentVC.view.addSubview(contentVC.view)
    contentVC.didMove(toParent: parentVC)
    
    NSLayoutConstraint.activate([
      contentVC.view.topAnchor.constraint(equalTo: parentVC.view.topAnchor),
      contentVC.view.bottomAnchor.constraint(equalTo: parentVC.view.bottomAnchor),
      contentVC.view.leadingAnchor.constraint(equalTo: parentVC.view.leadingAnchor),
      contentVC.view.trailingAnchor.constraint(equalTo: parentVC.view.trailingAnchor),
    ])
  }
}
