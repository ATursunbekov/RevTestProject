//
//  View.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var addButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "imageAdd"), for: .normal)
        return button
    }()
    
    lazy var showPlaces = {
        let button = UIButton()
        button.setImage(UIImage(named: "redirectionImage"), for: .normal)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    lazy var pageController: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = 3
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(collectionView)
        addSubview(pageController)
        addSubview(addButton)
        addSubview(showPlaces)
        
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(dHeight(50))
            make.leading.equalToSuperview().offset(dWidth(24))
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        showPlaces.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(dHeight(50))
            make.trailing.equalToSuperview().offset(dWidth(-24))
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pageController.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(dHeight(-76))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
