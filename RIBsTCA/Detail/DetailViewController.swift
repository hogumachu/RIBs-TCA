//
//  DetailViewController.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import RxSwift
import UIKit
import SwiftUI
import ComposableArchitecture

final class DetailViewController: BaseViewController<DetailView>,
                                  DetailPresentable,
                                  DetailViewControllable {}

struct DetailView: View {
  
  private let store: StoreOf<DetailFeature>
  
  init(store: StoreOf<DetailFeature>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack {
        Text("DetailView")
        
        Text("\(store.count)")
        
        Button(
          action: { store.send(.closeTapped) },
          label: { Text("Close") }
        )
      }
    }
  }
  
}
