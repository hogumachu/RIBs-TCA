//
//  RootInteractor.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import RxSwift
import ComposableArchitecture

protocol RootRouting: ViewableRouting {
  func attachHome()
  func detachHome()
}

protocol RootPresentable: Presentable {
  func attach(view: RootView)
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable {
  
  @ObservableState
  struct State {
    
  }
  
  enum Action {
    case homeTapped
  }
  
  weak var router: RootRouting?
  
  override func didBecomeActive() {
    super.didBecomeActive()
    presenter.attach(view: RootView(store: Store(
      initialState: RootFeature.State(),
      reducer: { reducer() }
    )))
  }
  
  func homeDidTapClose() {
    router?.detachHome()
  }
  
  private func reducer() -> Reduce<State, Action> {
    Reduce { [weak self] state, action in
      switch action {
      case .homeTapped:
        self?.router?.attachHome()
        return .none
      }
    }
  }
  
}
