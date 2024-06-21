//
//  PayCoordinator.swift
//  Runner
//
//  Created by Donna :) on 6/21/24.
//
import Foundation
import UIKit
final class PayCoordinator: BaseCoordinator{
 weak var navigationController: UINavigationController?
 weak var delegate: NewsToAppCoordinatorDelegate?
 
    override func start() {
     super.start()
        let container = PaymentWebViewController()
        container.coordinatorDelegate = self
        navigationController?.pushViewController(container, animated: false)
    }
        
    init(navigationController: UINavigationController?) {
      super.init()
      self.navigationController = navigationController
    }
    
}

protocol PayCoordinatorDelegate {
  func navigateToFlutter()
}

extension PayCoordinator: PayCoordinatorDelegate{
 func navigateToFlutter(){
   self.delegate?.navigateToFlutterViewController()
 }
}
