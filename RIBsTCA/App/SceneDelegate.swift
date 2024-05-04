//
//  SceneDelegate.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import UIKit
import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  private var routing: LaunchRouting?
  
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let scene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: scene)
    self.window = window
    let router = makeRootBuilder().build()
    self.routing = router
    router.launch(from: window)
  }
  
  private func makeRootBuilder() -> RootBuildable {
    return RootBuilder(dependency: AppComponent())
  }
  
}

