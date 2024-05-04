//
//  RootRouter.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs
import UIKit

protocol RootInteractable: Interactable, HomeListener {
  var router: RootRouting? { get set }
}

protocol RootViewControllable: ViewControllable {}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
  
  private let homeBuilder: HomeBuildable
  
  private var homeRouting: ViewableRouting?
  
  init(
    interactor: RootInteractable, 
    viewController: RootViewControllable,
    homeBuilder: HomeBuildable
  ) {
    self.homeBuilder = homeBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func attachHome() {
    guard homeRouting == nil else {
      return
    }
    let router = homeBuilder.build(withListener: interactor)
    self.homeRouting = router
    attachChild(router)
    let navigationController = UINavigationController(rootViewController: router.viewControllable.uiviewController)
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.modalPresentationStyle = .overFullScreen
    viewController.uiviewController.present(navigationController, animated: true)
  }
  
  func detachHome() {
    guard let router = homeRouting else {
      return
    }
    homeRouting = nil
    detachChild(router)
    router.viewControllable.uiviewController.dismiss(animated: true)
  }
  
}
