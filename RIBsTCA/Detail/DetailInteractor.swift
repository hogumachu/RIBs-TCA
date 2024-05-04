//
//  DetailInteractor.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import RxSwift
import ComposableArchitecture

protocol DetailRouting: ViewableRouting {}

protocol DetailPresentable: Presentable {
  func attach(view: DetailView)
}

protocol DetailListener: AnyObject {
  func detailDidTapClose()
}

final class DetailInteractor: PresentableInteractor<DetailPresentable>, DetailInteractable {
  
  @ObservableState
  struct State {
    var count: Int
    
    init(count: Int) {
      self.count = count
    }
  }
  
  enum Action {
    case closeTapped
  }
  
  weak var router: DetailRouting?
  weak var listener: DetailListener?
  
  private let count: Int
  
  init(presenter: DetailPresentable, count: Int) {
    self.count = count
    super.init(presenter: presenter)
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    presenter.attach(view: DetailView(store: Store(
      initialState: State(count: count),
      reducer: {
        DetailFeature(reducer: reducer())
      }
    )))
  }
  
  private func reducer() -> Reduce<State, Action> {
    Reduce { [weak self] state, action in
      switch action {
      case .closeTapped:
        self?.listener?.detailDidTapClose()
        return .none
      }
    }
  }
  
}
