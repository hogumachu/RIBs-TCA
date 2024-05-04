//
//  DetailBuilder.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs

protocol DetailDependency: Dependency {}

final class DetailComponent: Component<DetailDependency> {}

protocol DetailBuildable: Buildable {
  func build(withListener listener: DetailListener, count: Int) -> DetailRouting
}

final class DetailBuilder: Builder<DetailDependency>, DetailBuildable {
  
  override init(dependency: DetailDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: DetailListener, count: Int) -> DetailRouting {
    let component = DetailComponent(dependency: dependency)
    let viewController = DetailViewController()
    let interactor = DetailInteractor(presenter: viewController, count: count)
    interactor.listener = listener
    return DetailRouter(interactor: interactor, viewController: viewController)
  }
}
