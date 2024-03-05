//
//  MainCollectionViewCell.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    
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
    
    private lazy var background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "firstBack")
        return image
    }()
    
    lazy var locationBackground = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "turn on location"
        label.font = UIFont.getRoboto(size: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var locationImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "locationImage"))
        return image
    }()
    
    lazy var cityName: UILabel = {
        let label = UILabel()
        label.text = "Tehran"
        label.font = UIFont.getRoboto(size: 48, weight: .black)
        label.textColor = .white
        return label
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.font = UIFont.getRoboto(size: 100, weight: .black)
        label.textColor = .white
        return label
    }()
    
    lazy var tempSign: UILabel = {
        let label = UILabel()
        label.text = "°c"
        label.font = UIFont.getRoboto(size: 33, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2024 - jan - 4"
        label.font = UIFont.getRoboto(size: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var firstParView = CustomView()
    lazy var secondParView = CustomView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(background)
        background.addSubview(addButton)
        background.addSubview(showPlaces)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        showPlaces.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        background.addSubview(locationBackground)
        locationBackground.addSubview(locationLabel)
        locationBackground.addSubview(locationImage)
        
        locationBackground.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(addButton.snp.centerY)
            make.width.equalTo(150)
            make.height.equalTo(24)
        }
        
        locationImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(11)
            make.centerY.equalToSuperview()
            make.height.equalTo(12)
            make.width.equalTo(10)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(locationImage.snp.trailing).offset(4)
        }
        
        background.addSubview(cityName)
        background.addSubview(tempLabel)
        background.addSubview(tempSign)
        background.addSubview(dateLabel)
        
        cityName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationBackground.snp.bottom).offset(86)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(132)
        }
        
        tempSign.snp.makeConstraints { make in
            make.leading.equalTo(tempLabel.snp.trailing).offset(13)
            make.top.equalTo(cityName.snp.bottom).offset(32)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tempLabel.snp.bottom).offset(8.3)
        }
        
        background.addSubview(firstParView)
        background.addSubview(secondParView)
        
        secondParView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(170)
        }
        
        firstParView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(secondParView.snp.top).offset(15)
            make.height.equalTo(170)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
