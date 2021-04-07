//
//  BaseViewController.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import RxSwift

public class BaseViewController: UIViewController {
    
    public let navigationSubject = PublishSubject<Navigation<Any>>()
    var indicatorsBack: UIView?
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showSplash() {
        let splashPage = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "Splash")
        splashPage.modalPresentationStyle = .fullScreen
        self.present(splashPage, animated: false, completion: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
