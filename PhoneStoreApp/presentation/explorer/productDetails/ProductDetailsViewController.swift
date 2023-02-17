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

    private var modelArray: [ProductDetails] = []{
        didSet {
            productCollectionView.model = modelArray
        }
    }
    
    private lazy var productCollectionView: ProductCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 393, height: 300)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        layout.estimatedItemSize = CGSize(width: 393, height: 300)
        let phonesCV = ProductCollectionView(frame: .zero, layout: layout)
        phonesCV.register(ProductCollectionViewCell.self)
        phonesCV.model = modelArray
        phonesCV.showsHorizontalScrollIndicator = false
        phonesCV.translatesAutoresizingMaskIntoConstraints = false
        return phonesCV
    }()
    
    private lazy var detailedProdView: DetailedProdView = .create {
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Details"
        setupNavigationBar()
        setupLayout()
        detailsLoader()
    }
    
    private func detailsLoader() {
        viewModel?.makeAPIRequest { result in
                switch result {
                case .success(let productDetails):
                    self.modelArray = [productDetails]
//                    self.detailedProdView = [productDetails.]
                    print(productDetails)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private func setupNavigationBar() {

        guard let navigationBar = navigationController?.navigationBar else { return }
        guard let navigationController = navigationController else  { return }

        navigationController.isNavigationBarHidden = false
        navigationBar.backgroundColor = Theme.appBackgroundColor
        navigationController.title = "Product Details"

        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "backButton"), for: .normal)
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
        navigationController?.popViewController(animated: true)
    }

    @objc func goToBusket() {

    }
    
    private func setupLayout() {
        
        view.addSubview(productCollectionView, constraints: [
            equal(\.safeAreaLayoutGuide.topAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 300),
            equal(\.widthAnchor)
        ])

        view.addSubview(detailedProdView, constraints: [
            equal(\.topAnchor, to: productCollectionView, \.bottomAnchor, constant: 7),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}
