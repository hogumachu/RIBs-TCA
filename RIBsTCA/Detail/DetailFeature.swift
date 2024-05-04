//
//  DetailFeature.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import ComposableArchitecture

@Reducer
struct DetailFeature {
  
  typealias State = DetailInteractor.State
  typealias Action = DetailInteractor.Action
  
  private let reducer: Reduce<State, Action>
  
  init(reducer: Reduce<State, Action>) {
    self.reducer = reducer
  }
  
  var body: some ReducerOf<Self> {
    reducer
  }
  
}

