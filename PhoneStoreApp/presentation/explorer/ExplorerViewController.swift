//
//  ExplorerViewController.swift
//  PhoneStoreApp
//
//  Created by i0240 on 13.12.2022.
//

import UIKit

class ExplorerViewController: UIViewController {
    
    var delegateRouting: ExplorerRoutingDelegate!
    var explorerViewModel: ExplorerViewModel!
    private var filters: PhoneFilter?
    
    private var modelArray: [HeadDataItem] = [] {
        didSet {
            headCollectionView.model = modelArray
        }
    }
    
    private var middleModelArray: [HomeStoreProduct] = [] {
        didSet {
            middleCollectionView.model = middleModelArray
        }
    }
    
    private var bottomModelArray: [BestSellerProduct] = [] {
        didSet {
            bottomCollectionView.model = bottomModelArray
        }
    }
    
    private lazy var scrollView: UIScrollView = .create {
        $0.showsVerticalScrollIndicator = false
    }
    
    private lazy var geoButton: UIButton = .create {
        $0.setImage(UIImage(named: "location"), for: .normal)
        $0.addTarget(self, action: #selector(locationAction), for: .touchUpInside)
    }

    private lazy var centerTextField: FormDropdown = .create {
        Theme.textFieldStyle($0, ofSize: 15, weight: .medium)
        $0.textColor = Theme.appDarkBlueColor
        $0.text = "Zihuatanejo, Gro"
        $0.dropdownDelegate = self
    }
    
    private lazy var filterButton: UIButton = .create {
        $0.setImage(UIImage(named: "filter"), for: .normal)
        $0.addTarget(self, action: #selector(showFilter), for: .touchUpInside)
    }
    
    private lazy var categoryLabel: UILabel = .create {
        $0.numberOfLines = 0
        $0.text = "Select Category"
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 25, weight: .bold)
        $0.textColor = Theme.appDarkBlueColor
    }
    
    private lazy var viewCategoryButton: UIButton = .create {
        $0.setTitle("view all", for: UIControl.State.normal)
        $0.setTitleColor(Theme.appOrangeColor, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 19).isActive = true
        $0.addTarget(self, action: #selector(showCategories), for: .touchUpInside)
    }
    
    private lazy var headCollectionView: HeadExplorerCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let headCV = HeadExplorerCollectionView(frame: .zero, layout: layout)
        headCV.register(HeadExplorerCollectionViewCell.self)
        headCV.model = modelArray
        headCV.showsHorizontalScrollIndicator = false
        headCV.translatesAutoresizingMaskIntoConstraints = false
        return headCV
    }()
    
    private lazy var searchTextField: UISearchTextField = .create {
        $0.borderStyle = .roundedRect
        $0.leftView?.tintColor = Theme.appOrangeColor
        $0.tintColor = Theme.appDarkBlueColor
        $0.attributedPlaceholder = NSAttributedString(string: "   Search", attributes: [.font: UIFont(name: "MarkPro", size: 12)!])
        $0.backgroundColor = Theme.appWhiteColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 18
        $0.isEnabled = true
        $0.delegate = self
    }
    
    private lazy var allItemsButton: UIButton = .create {
        $0.backgroundColor = Theme.appOrangeColor
        $0.setImage(UIImage(named: "all-items"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 16
        $0.addTarget(nil, action: #selector(allItemsButtonTap), for: .touchUpInside)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private lazy var hotSalesLabel: UILabel = .create {
        $0.numberOfLines = 0
        $0.text = "Hot sales"
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 25, weight: .bold)
        $0.textColor = Theme.appDarkBlueColor
    }
    
    private lazy var seeSalesButton: UIButton = .create {
        $0.setTitle("see more", for: UIControl.State.normal)
        $0.setTitleColor(Theme.appOrangeColor, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 19).isActive = true
        $0.addTarget(self, action: #selector(showHotSales), for: .touchUpInside)
    }
    
    private lazy var middleCollectionView: MiddleExplorerCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width, height: 182)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 4)
        let middleCV = MiddleExplorerCollectionView(frame: .zero, layout: layout)
        middleCV.register(MiddleExplorerCollectionViewCell.self)
        middleCV.model = middleModelArray
        middleCV.showsHorizontalScrollIndicator = false
        middleCV.translatesAutoresizingMaskIntoConstraints = false
        return middleCV
    }()
    
    private lazy var bestSellersLabel: UILabel = .create {
        $0.numberOfLines = 0
        $0.text = "Best Sellers"
        $0.textAlignment = .center
        Theme.labelStyle($0, ofSize: 25, weight: .bold)
    }
    
    private lazy var seeSellersButton: UIButton = .create {
        $0.setTitle("see more", for: UIControl.State.normal)
        $0.setTitleColor(Theme.appOrangeColor, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 19).isActive = true
        $0.addTarget(self, action: #selector(showBestSellers), for: .touchUpInside)
    }
    
    private lazy var bottomCollectionView: BottomExplorerCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/2.2, height: 227)
        layout.sectionInset = UIEdgeInsets(top: 11, left: 11, bottom: 11, right: 11)
        let bottomCV = BottomExplorerCollectionView(frame: .zero, layout: layout)
        bottomCV.register(BottomExplorerCollectionViewCell.self)
        bottomCV.model = bottomModelArray
        bottomCV.delegateRoute = self
        bottomCV.showsHorizontalScrollIndicator = false
        bottomCV.translatesAutoresizingMaskIntoConstraints = false
        return bottomCV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.appBackgroundColor
        
        setupLayout()
        setupModel()
        homeStoreLoader()
        bestSellerLoader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + bottomCollectionView.frame.origin.y)
    }
    
    private func homeStoreLoader() {
        explorerViewModel.makeAPIRequest { (homeStoreProducts) in
            DispatchQueue.main.async {
                self.middleModelArray = homeStoreProducts.homeStore
                self.middleCollectionView.reloadData()
                
            }
        }
    }
    
    private func bestSellerLoader() {
        explorerViewModel.makeAPIRequest { (explorerProducts) in
            DispatchQueue.main.async {
                self.bottomModelArray = explorerProducts.bestSeller
                self.bottomCollectionView.reloadData()
                
            }
        }
    }
    
    private func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        guard let navigationController = navigationController else  { return }

        navigationController.isNavigationBarHidden = true
        navigationBar.backgroundColor = Theme.appBackgroundColor
    }
    
    private func setupLayout() {
        
        view.addSubview(scrollView, constraints: [
            equal(\.safeAreaLayoutGuide.topAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(centerTextField, constraints: [
            equal(\.topAnchor, to: scrollView, \.topAnchor),
            equal(\.centerXAnchor)
        ])
        
        scrollView.addSubview(geoButton, constraints: [
            equal(\.trailingAnchor, to: centerTextField, \.leadingAnchor, constant: -11),
            equal(\.centerYAnchor, to: centerTextField, \.centerYAnchor)
        ], singleConstraints: [
            equal(\.widthAnchor, constant: 12),
            equal(\.heightAnchor, constant: 15)
        ])
        
        scrollView.addSubview(filterButton, constraints: [
            equal(\.trailingAnchor, to: view, \.trailingAnchor, constant: -35),
            equal(\.centerYAnchor, to: centerTextField, \.centerYAnchor)
        ], singleConstraints: [
            equal(\.widthAnchor, constant: 11),
            equal(\.heightAnchor, constant: 13)
        ])
        
        scrollView.addSubview(categoryLabel, constraints: [
            equal(\.topAnchor, to: centerTextField, \.bottomAnchor, constant: 18),
            equal(\.leadingAnchor, to: scrollView, \.leadingAnchor, constant: 17)
        ])
        
        scrollView.addSubview(viewCategoryButton, constraints: [
            equal(\.centerYAnchor, to: categoryLabel, \.centerYAnchor),
            equal(\.trailingAnchor, to: view, \.trailingAnchor, constant: -33)
        ])
        
        scrollView.addSubview(headCollectionView, constraints: [
            equal(\.topAnchor, to: categoryLabel, \.bottomAnchor, constant: 24),
            equal(\.leadingAnchor, to: view, \.leadingAnchor, constant: 27),
            equal(\.trailingAnchor, to: view, \.trailingAnchor),
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 93)
        ])
        
        scrollView.addSubview(searchTextField, constraints: [
            equal(\.topAnchor, to: headCollectionView, \.bottomAnchor, constant: 35),
            equal(\.leadingAnchor, to: view, \.leadingAnchor, constant: 35),
            equal(\.trailingAnchor)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 34)
        ])
        
        scrollView.addSubview(allItemsButton, constraints: [
            equal(\.centerYAnchor, to: searchTextField, \.centerYAnchor),
            lessOrEqual(\.leadingAnchor, to: searchTextField, \.trailingAnchor, constant: 11),
            equal(\.trailingAnchor,to: view, \.trailingAnchor, constant: -37)
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 34),
            equal(\.widthAnchor, constant: 34)
        ])
        
        scrollView.addSubview(hotSalesLabel, constraints: [
            equal(\.topAnchor, to: searchTextField, \.bottomAnchor, constant: 24),
            equal(\.leadingAnchor, to: view, \.leadingAnchor, constant: 17)
        ])
        
        scrollView.addSubview(seeSalesButton, constraints: [
            equal(\.centerYAnchor, to: hotSalesLabel, \.centerYAnchor),
            equal(\.trailingAnchor, to: view, \.trailingAnchor, constant: -33)
        ])
        
        scrollView.addSubview(middleCollectionView, constraints: [
            equal(\.topAnchor, to: hotSalesLabel, \.bottomAnchor, constant: 9),
            equal(\.leadingAnchor, to: view, \.leadingAnchor),
            equal(\.trailingAnchor, to: view, \.trailingAnchor),
        ], singleConstraints: [
            equal(\.heightAnchor, constant: 182)
        ])
        
        scrollView.addSubview(bestSellersLabel, constraints: [
            equal(\.topAnchor, to: middleCollectionView, \.bottomAnchor, constant: 11),
            equal(\.leadingAnchor, to: view, \.leadingAnchor, constant: 17)
        ])
        
        scrollView.addSubview(seeSellersButton, constraints: [
            equal(\.centerYAnchor, to: bestSellersLabel, \.centerYAnchor),
            equal(\.trailingAnchor, to: view, \.trailingAnchor, constant: -33)
        ])
        
        scrollView.addSubview(bottomCollectionView, constraints: [
            equal(\.topAnchor, to: bestSellersLabel, \.bottomAnchor, constant: 16),
            equal(\.leadingAnchor, to: view, \.leadingAnchor),
            equal(\.trailingAnchor, to: view, \.trailingAnchor),
            equal(\.bottomAnchor, to: view, \.bottomAnchor)
        ])
        
    }
    
    @objc private func showCategories() {
        
    }
    
    @objc private func allItemsButtonTap() {
        
    }
    
    @objc private func showHotSales() {
        
    }
    
    @objc private func showBestSellers() {
        
    }
    
    @objc private func setupModel() {
        modelArray.removeAll()
        
        var headPhoneItem = HeadDataItem()
        headPhoneItem.categories = "Phones"
        headPhoneItem.img = UIImage(named: "phone-ic")!
        headPhoneItem.color = Theme.appOrangeColor
        modelArray.append(headPhoneItem)
        
        var headComputerItem = HeadDataItem()
        headComputerItem.categories = "Computer"
        headComputerItem.img = UIImage(named: "computer-ic")!
        headComputerItem.color = Theme.appWhiteColor
        modelArray.append(headComputerItem)
        
        var headHealthItem = HeadDataItem()
        headHealthItem.categories = "Health"
        headHealthItem.img = UIImage(named: "health-ic")!
        headHealthItem.color = Theme.appWhiteColor
        modelArray.append(headHealthItem)
        
        var headBooksItem = HeadDataItem()
        headBooksItem.categories = "Books"
        headBooksItem.img = UIImage(named: "books-ic")!
        headBooksItem.color = Theme.appWhiteColor
        modelArray.append(headBooksItem)
        
        var headBItem = HeadDataItem()
        headBItem.categories = "Items"
        headBItem.img = UIImage(named: "books-ic")!
        headBItem.color = Theme.appWhiteColor
        modelArray.append(headBItem)
        
        var headBsItem = HeadDataItem()
        headBsItem.categories = "Items"
        headBsItem.img = UIImage(named: "books-ic")!
        headBItem.color = Theme.appWhiteColor
        modelArray.append(headBsItem)
    }
    
    @objc private func locationAction() {

    }
    
    @objc private func showFilter() {
       let filterVC = FilterViewController(filters: filters)
//        filterVC.modalPresentationStyle = .formSheet
//        filterVC.preferredContentSize = .init(width: 500, height: 400)
//        filterVC.modalTransitionStyle = .crossDissolve
        present(filterVC, animated: true)
    }
    
}

// MARK: - FormDropdownDelegate
extension ExplorerViewController: FormDropdownDelegate {
    func showDataPicker(dropdown: FormDropdown) {
        
        }
    
    func valueChanged(dropdown: FormDropdown) {
        
    }
}

// MARK: - UITextFieldDelegate
extension ExplorerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        
        return true
    }
}

// MARK: - BottomExplorerCollectionViewDelegate
extension ExplorerViewController: BottomExplorerCollectionViewDelegate {
    func routeToDetails() {
        delegateRouting.routeToProductDetails()
    }
}

// MARK: - BottomExplorerCollectionViewCellDelegate
extension ExplorerViewController: BottomExplorerCollectionViewCellDelegate {
    func setFavorite(product: BestSellerProduct) {
        explorerViewModel.setFavorite(product: product)
    }
}
