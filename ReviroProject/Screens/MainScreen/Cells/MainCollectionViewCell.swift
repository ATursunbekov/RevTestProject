//
//  MainCollectionViewCell.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    
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
    
    lazy var sunImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "sun"))
        return image
    }()
    
    lazy var sunLabel: UILabel = {
        let label = UILabel()
        label.text = "UV Index"
        label.textColor = .white
        label.font = .getRoboto(size: 14, weight: .bold)
        return label
    }()
    
    lazy var windImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "wind"))
        return image
    }()
    
    lazy var windLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.textColor = .white
        label.font = .getRoboto(size: 14, weight: .bold)
        return label
    }()
    
    lazy var cloudImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "humidity"))
        return image
    }()
    
    lazy var cloudLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.textColor = .white
        label.font = .getRoboto(size: 14, weight: .bold)
        return label
    }()
    
    lazy var sunValue: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = .getRoboto(size: 24, weight: .bold)
        return label
    }()
    
    lazy var windValue: UILabel = {
        let label = UILabel()
        label.text = "12 m/s"
        label.textColor = .white
        label.font = .getRoboto(size: 24, weight: .bold)
        return label
    }()
    
    lazy var cloudValue: UILabel = {
        let label = UILabel()
        label.text = "49%"
        label.textColor = .white
        label.font = .getRoboto(size: 24, weight: .bold)
        return label
    }()
    
    lazy var firstDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        return view
    }()

    lazy var secondDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32
        layout.itemSize = CGSize(width: dWidth(35), height: dHeight(77))
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupConstraints() {
        contentView.addSubview(background)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        background.addSubview(locationBackground)
        locationBackground.addSubview(locationLabel)
        locationBackground.addSubview(locationImage)
        
        locationBackground.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(dHeight(58))
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
            make.leading.trailing.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(170)
        }
        
        firstParView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.bottom.equalTo(secondParView.snp.top).offset(15)
            make.height.equalTo(170)
        }
        
        firstParView.addSubview(sunImage)
        firstParView.addSubview(sunLabel)
        firstParView.addSubview(sunValue)
        firstParView.addSubview(windImage)
        firstParView.addSubview(windLabel)
        firstParView.addSubview(windValue)
        firstParView.addSubview(cloudImage)
        firstParView.addSubview(cloudLabel)
        firstParView.addSubview(cloudValue)
        firstParView.addSubview(firstDivider)
        firstParView.addSubview(secondDivider)
        
        sunImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(dHeight(58))
            make.leading.equalToSuperview().offset(dWidth(32))
            make.height.equalTo(22)
            make.width.equalTo(22)
        }
        
        sunLabel.snp.makeConstraints { make in
            make.centerY.equalTo(sunImage.snp.centerY)
            make.leading.equalTo(sunImage.snp.trailing).offset(dWidth(4))
        }
        
        sunValue.snp.makeConstraints { make in
            make.top.equalTo(sunImage.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(66.5)
        }
        
        firstDivider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(sunLabel.snp.trailing).offset(18.5)
            make.width.equalTo(1)
            make.height.equalTo(dHeight(65))
        }
       
        windImage.snp.makeConstraints { make in
            make.leading.equalTo(firstDivider.snp.trailing).offset(dWidth(26.5))
            make.top.equalToSuperview().offset(dHeight(56))
            make.height.equalTo(22)
            make.width.equalTo(22)
        }
        
        windLabel.snp.makeConstraints { make in
            make.centerY.equalTo(windImage.snp.centerY)
            make.leading.equalTo(windImage.snp.trailing).offset(4)
        }
        
        windValue.snp.makeConstraints { make in
            make.top.equalTo(windImage.snp.bottom).offset(12)
            make.leading.equalTo(firstDivider.snp.trailing).offset(18.5)
        }
        
        secondDivider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(windLabel.snp.trailing).offset(26.5)
            make.width.equalTo(1)
            make.height.equalTo(dHeight(65))
        }
        
        cloudImage.snp.makeConstraints { make in
            make.leading.equalTo(secondDivider.snp.trailing).offset(dWidth(18.5))
            make.top.equalToSuperview().offset(dHeight(56))
            make.height.equalTo(16)
            make.width.equalTo(22)
        }
        
        cloudLabel.snp.makeConstraints { make in
            make.leading.equalTo(cloudImage.snp.trailing).offset(4)
            make.centerY.equalTo(cloudImage.snp.centerY)
        }
        
        cloudValue.snp.makeConstraints { make in
            make.leading.equalTo(secondDivider.snp.trailing).offset(38)
            make.top.equalTo(cloudImage.snp.bottom).offset(12)
        }
        
        secondParView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(37)
            make.top.bottom.equalToSuperview().inset(43)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath)
        return cell
    }
}
