//
//  RootBuilder.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs

protocol RootDependency: Dependency {}

final class RootComponent: Component<RootDependency>, HomeDependency {}

protocol RootBuildable: Buildable {
  func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
  
  override init(dependency: RootDependency) {
    super.init(dependency: dependency)
  }
  
  func build() -> LaunchRouting {
    let component = RootComponent(dependency: dependency)
    let viewController = RootViewController()
    let interactor = RootInteractor(presenter: viewController)
    return RootRouter(
      interactor: interactor,
      viewController: viewController,
      homeBuilder: HomeBuilder(dependency: component)
    )
  }
  
}
