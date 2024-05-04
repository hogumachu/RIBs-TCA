//
//  BaseViewController.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import UIKit
import SwiftUI

class BaseViewController<V: View>: UIViewController {
  func attach(view: V) {
    view.attach(to: self)
  }
}
