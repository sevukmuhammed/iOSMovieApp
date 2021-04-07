//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import RxSwift
import Swinject
import Reachability
import Alamofire
import FirebaseRemoteConfig

final class SplashViewController: BaseViewController, SplashStoryboardLoadable {
    
   
    @IBOutlet weak var splashLabel: UILabel!
    private let remoteConfig = RemoteConfig.remoteConfig()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NetworkState.isConnected() {
            fetchValues()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.showAlert(message: "İnternet Bağlantısı Yok.")
            }

        }
    }
    
    func fetchValues() {
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        self.remoteConfig.fetch(withExpirationDuration: 0, completionHandler: { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate { (bool, error) in
                    guard error == nil else {
                        return
                    }
                    guard let value = self.remoteConfig.configValue(forKey: "splashText").stringValue else { return }
                    DispatchQueue.main.async {
                        self.splashLabel.fadeTransition(0.4)
                        self.splashLabel.text = value
                    }
                }
            } else {
                print("something wrong")
            }
        })
    }
    
}
