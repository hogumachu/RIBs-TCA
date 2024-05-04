//
//  HomeViewController.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import RxSwift
import UIKit
import SwiftUI
import ComposableArchitecture

final class HomeViewController: BaseViewController<HomeView>,
                                HomePresentable,
                                HomeViewControllable {}

struct HomeView: View {
  
  private let store: StoreOf<HomeFeature>
  
  init(store: StoreOf<HomeFeature>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack {
        Text("HomeView")
        Button(
          action: { store.send(.closeTapped) },
          label: { Text("Close") }
        )
        
        Text("\(store.count)")
        
        HStack {
          Button(
            action: { store.send(.plusTapped) },
            label: { Text("+") }
          )
          Button(
            action: { store.send(.minusTapped) },
            label: { Text("-") }
          )
        }
        
        Button(
          action: { store.send(.detailTapped) },
          label: { Text("Detail") }
        )
      }
    }
  }
  
}
