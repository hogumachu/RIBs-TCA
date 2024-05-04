//
//  DetailRouter.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs

protocol DetailInteractable: Interactable {
  var router: DetailRouting? { get set }
  var listener: DetailListener? { get set }
}

protocol DetailViewControllable: ViewControllable {}

final class DetailRouter: ViewableRouter<DetailInteractable, DetailViewControllable>, DetailRouting {
  override init(interactor: DetailInteractable, viewController: DetailViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
