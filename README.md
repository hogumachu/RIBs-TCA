# RIBs+TCA
[RIBs is a framework](https://github.com/uber/RIBs?tab=readme-ov-file#what-is-the-difference-between-ribs-and-mvviper) and [TCA](https://github.com/pointfreeco/swift-composable-architecture) is a Architecture (because its name is _The Composable Architecture_)
RIBs consists of Router, Interactor, Builder and View(optional). RIBs+TCA replaced View with SwiftUI and structured Interactor to perform the role of Reducer.

## Why use?
- Role separation is very well implemented (Advantages of RIBs).
- Navigation is not handled in the View.
  - Modularization of interface/implementation structures is possible.
  - So you can use [µFeatures architecture](https://docs.tuist.io/guide/scale/ufeatures-architecture.html).
- Even if you're already using RIBs, you can easily add SwiftUI and TCA.
- You can choose between UIKit and SwiftUI depending on the situation.
- You can leverage the great features of TCA (such as dependency injection, etc).

## Differences
- There is a Reducer called Feature, but the Interactor defines the State, Action, and the behavior of the Reducer.
```swift
// HomeInteractor
final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {
  
  @ObservableState
  struct State {
    var count: Int = 0
  }
  
  enum Action {
    case closeTapped
    // ...
    case detailTapped
  }

  override func didBecomeActive() {
    super.didBecomeActive()
    presenter.attach(view: HomeView(store: Store(
      initialState: State(),
      reducer: {
        HomeFeature(reducer: reducer())
      }
    )))
  }
  
  private func reducer() -> Reduce<State, Action> {
    Reduce { [weak self] state, action in
      switch action {
      case .closeTapped:
        self?.listener?.homeDidTapClose()
        return .none
      // ...
      case .detailTapped:
        self?.router?.attachDetail(count: state.count)
        return .none
      }
    }
  }
  
}


// HomeFeature
@Reducer
struct HomeFeature {
  
  typealias State = HomeInteractor.State
  typealias Action = HomeInteractor.Action
  
  private let reducer: Reduce<State, Action>
  
  init(reducer: Reduce<State, Action>) {
    self.reducer = reducer
  }
  
  var body: some ReducerOf<Self> {
    reducer
  }
  
}
```

## Version
- RIBs: `0.9.2`
- TCA: `1.10.2`
