//
//  HomeRouter.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs

protocol HomeInteractable: Interactable, DetailListener {
  var router: HomeRouting? { get set }
  var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {
  
  private let detailBuilder: DetailBuildable
  
  private var detailRouting: ViewableRouting?
  
  init(interactor: HomeInteractable, viewController: HomeViewControllable, detailBuilder: DetailBuildable) {
    self.detailBuilder = detailBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func attachDetail(count: Int) {
    guard detailRouting == nil else {
      return
    }
    let router = detailBuilder.build(withListener: interactor, count: count)
    detailRouting = router
    attachChild(router)
    viewController.uiviewController.navigationController?.pushViewController(router.viewControllable.uiviewController, animated: true)
  }
  
  func detachDetail() {
    guard let router = detailRouting else {
      return
    }
    detachChild(router)
    detailRouting = nil
    viewController.uiviewController.navigationController?.popViewController(animated: true)
  }
  
}
