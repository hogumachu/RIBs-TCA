//
//  RootFeature.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import ComposableArchitecture

@Reducer
struct RootFeature {
  
  typealias State = RootInteractor.State
  typealias Action = RootInteractor.Action
  
  private let reducer: Reduce<State, Action>
  
  init(reducer: Reduce<State, Action>) {
    self.reducer = reducer
  }
  
  var body: some ReducerOf<Self> {
    reducer
  }
  
}
