//
//  AppComponent.swift
//  RIBsTCA
//
//  Created by 홍성준 on 5/4/24.
//

import RIBs

final class AppComponent: Component<EmptyComponent>, RootDependency {
  
  init() {
    super.init(dependency: EmptyComponent())
  }
  
}
