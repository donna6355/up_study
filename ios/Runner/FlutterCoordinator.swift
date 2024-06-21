//
//  FlutterCoordinator.swift
//  Runner
//
//  Created by Donna :) on 6/21/24.
//

import Foundation
import UIKit
final class FlutterCoordinator: BaseCoordinator{
  weak var navigationController: UINavigationController?
  weak var delegate: FlutterToAppCoordinatorDelegate?
override func start() {
  super.start()
  navigationController?.popToRootViewController(animated: true)
}
init(navigationController: UINavigationController?) {
  super.init()
  self.navigationController = navigationController
}
}
