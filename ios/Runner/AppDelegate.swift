import Flutter
import UIKit
import NaverThirdPartyLogin
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private var mainCoordinator : AppCoordinator?
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                              binaryMessenger: controller.binaryMessenger)
    let payChannel = FlutterMethodChannel(name: "samples.flutter.dev/pay",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // This method is invoked on the UI thread.
      guard call.method == "getBatteryLevel" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self.receiveBatteryLevel(result: result)
    })
    payChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // This method is invoked on the UI thread.
      guard call.method == "openPayWeb" else {
        result(FlutterMethodNotImplemented)
        return
      }
        self.mainCoordinator?.start()

    })
      //comment out as it conflicts with kakao sdk
      // let navigationController = UINavigationController(rootViewController: controller)
      //     navigationController.isNavigationBarHidden = true
      //     window?.rootViewController = navigationController
      //     mainCoordinator = AppCoordinator(navigationController: navigationController)
      //     window?.makeKeyAndVisible()
    GMSServices.provideAPIKey("AIzaSyCWwqOHL04kB2tfnBMsaQsQHldEydgEElw")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func receiveBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState == UIDevice.BatteryState.unknown {
      result(FlutterError(code: "UNAVAILABLE",
                          message: "Battery level not available.",
                          details: nil))
    } else {
      result(Int(device.batteryLevel * 100))
    }
  }


  override func application(
      _ app: UIApplication, 
      open url: URL, 
      options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
      var applicationResult = false
      if (!applicationResult) {
        applicationResult = NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
      }
      // if you use other application url process, please add code here.
      
      if (!applicationResult) {
        applicationResult = super.application(app, open: url, options: options)
      }
      return applicationResult
  }
}
