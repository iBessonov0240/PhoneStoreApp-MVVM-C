//
//  StartViewController.swift
//  PhoneStoreApp
//
//  Created by i0240 on 12.12.2022.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    
    var delegateRouting: StartRoutingDelegate!
    var startViewModel: StartViewModel!
    
    private let backgroundImage: UIImage = UIImage(named: "launch-screen")!
    
    private lazy var backgroundImageView: UIImageView = .create {
        $0.image = backgroundImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        setupLayout()
        
    }
    
    private func setupLayout() {

        let backgroundImageRatio = backgroundImage.size.width / backgroundImage.size.height

        view.addSubview(backgroundImageView, constraints: .pin)

        backgroundImageView.contentMode = .scaleAspectFill
        
        self.perform(#selector(hideSplash), with: backgroundImageView, afterDelay: 2.0)
    }
    
    @objc func hideSplash() {
        backgroundImageView.removeFromSuperview()
        delegateRouting?.routeToTabBar()
    }
}
