//
//  ProductDetailsViewController.swift
//  PhoneStoreApp
//
//  Created by i0240 on 30.12.2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    var delegateRouting: ProductDetailsRoutingDelegate? = nil
    var viewModel: ProductDetailsViewModel? = nil
    
    private lazy var productCollectionView: ProductCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let phonesCV = ProductCollectionView(frame: .zero, layout: layout)
        phonesCV.register(ProductCollectionViewCell.self)
//        phonesCV.model = modelArray
        phonesCV.showsHorizontalScrollIndicator = false
        phonesCV.translatesAutoresizingMaskIntoConstraints = false
        return phonesCV
    }()
    
    private lazy var detailedProdView: DetailedProdView = .create {
        $0.layer.cornerRadius = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        createStar()
        setupNavigationBar()
        setupLayout()
    }
    
    private func createStar() {
        detailedProdView.setUpStars()
    }
    
    private func setupNavigationBar() {
        
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        guard let navigationController = navigationController else  { return }
       
        navigationController.isNavigationBarHidden = false
        navigationBar.backgroundColor = .white
        navigationController.title = "Product Details"
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "backButton"), for: .normal)
//        leftButton.backgroundColor = Theme.appDarkBlueColor
        leftButton.setBackgroundImage(UIImage(named: "backImageBack"), for: .normal)
        leftButton.imageView?.contentMode = .scaleAspectFit
        leftButton.addTarget(self, action: #selector(backToCatalog), for: .touchUpInside)
        let item = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = item
        navigationBar.prefersLargeTitles = false
        
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "basket"), for: .normal)
        rightButton.setBackgroundImage(UIImage(named: "navBusketBack"), for: .normal)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightButton.addTarget(self, action: #selector(goToBusket), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = item2
        navigationBar.prefersLargeTitles = false
    }
    
    @objc func backToCatalog() {
        
    }

    @objc func goToBusket() {
        
    }
    
    private func setupLayout() {
        view.addSubview(productCollectionView, constraints: [
            equal(\.safeAreaLayoutGuide.topAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ])
        
        view.addSubview(detailedProdView, constraints: [
            equal(\.topAnchor, to: productCollectionView, \.bottomAnchor, constant: 7),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ])
    }
}
