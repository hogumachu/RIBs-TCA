//
//  RootViewController.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import RxSwift
import UIKit
import SwiftUI
import ComposableArchitecture

final class RootViewController: BaseViewController<RootView>,
                                RootPresentable,
                                RootViewControllable {}

struct RootView: View {
  
  @ComposableArchitecture.Bindable private var store: StoreOf<RootFeature>
  
  init(store: StoreOf<RootFeature>) {
    self.store = store
  }
  
  var body: some View {
    VStack {
      Text("RootView")
      Button(
        action: { store.send(.homeTapped) },
        label: { Text("Home") }
      )
    }
  }
  
}
