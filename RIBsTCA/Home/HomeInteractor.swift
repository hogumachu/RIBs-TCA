//
//  HomeInteractor.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import RxSwift
import ComposableArchitecture

protocol HomeRouting: ViewableRouting {
  func attachDetail(count: Int)
  func detachDetail()
}

protocol HomePresentable: Presentable {
  func attach(view: HomeView)
}

protocol HomeListener: AnyObject {
  func homeDidTapClose()
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {
  
  @ObservableState
  struct State {
    var count: Int = 0
    var countString: String = "0"
  }
  
  enum Action {
    case closeTapped
    case plusTapped
    case minusTapped
    case detailTapped
  }
  
  weak var router: HomeRouting?
  weak var listener: HomeListener?
  
  override func didBecomeActive() {
    super.didBecomeActive()
    presenter.attach(view: HomeView(store: Store(
      initialState: State(),
      reducer: {
        HomeFeature(reducer: reducer())
      }
    )))
  }
  
  func detailDidTapClose() {
    router?.detachDetail()
  }
  
  private func reducer() -> Reduce<State, Action> {
    Reduce { [weak self] state, action in
      switch action {
      case .closeTapped:
        self?.listener?.homeDidTapClose()
        return .none
        
      case .plusTapped:
        state.count += 1
        
        return .none
        
      case .minusTapped:
        state.count -= 1
        return .none
        
      case .detailTapped:
        self?.router?.attachDetail(count: state.count)
        return .none
      }
    }
  }
  
}
