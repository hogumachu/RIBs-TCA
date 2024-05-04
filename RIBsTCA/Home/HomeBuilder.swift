//
//  HomeBuilder.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import UIKit

protocol HomeDependency: Dependency {}

final class HomeComponent: Component<HomeDependency>, DetailDependency {}

protocol HomeBuildable: Buildable {
  func build(withListener listener: HomeListener) -> ViewableRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {
  
  override init(dependency: HomeDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: HomeListener) -> ViewableRouting {
    let component = HomeComponent(dependency: dependency)
    let viewController = HomeViewController()
    let interactor = HomeInteractor(presenter: viewController)
    interactor.listener = listener
    return HomeRouter(interactor: interactor, viewController: viewController, detailBuilder: DetailBuilder(dependency: component))
  }
}
