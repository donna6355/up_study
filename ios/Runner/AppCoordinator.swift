//
//  AppCoordinator.swift
//  Runner
//
//  Created by Donna :) on 6/21/24.
//
import Foundation
import UIKit
class AppCoordinator: BaseCoordinator{
 weak var navigationController: UINavigationController?
 
 init(navigationController: UINavigationController) {
   super.init()
   self.navigationController = navigationController
 }
 
 override func start() {
  super.start()
  navigateToNewsViewController() }
 }
protocol NewsToAppCoordinatorDelegate: AnyObject {
 func navigateToFlutterViewController()
}
protocol FlutterToAppCoordinatorDelegate: AnyObject {
 func navigateToNewsViewController()
}
extension AppCoordinator: NewsToAppCoordinatorDelegate{
 func navigateToFlutterViewController(){
   let coordinator = FlutterCoordinator(navigationController:     self.navigationController)
   coordinator.delegate = self
   self.add(coordinator)
   coordinator.start()
 }
}
extension AppCoordinator: FlutterToAppCoordinatorDelegate{
 func navigateToNewsViewController(){
   let coordinator = PayCoordinator(navigationController:    self.navigationController)
   coordinator.delegate = self
   self.add(coordinator)
   coordinator.start()
 }
}
