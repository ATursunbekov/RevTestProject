//
//  WeatherCollectionViewCell.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 6/3/24.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "WeatherCollectionViewCell"
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Now"
        label.textColor = .white
        label.font = .getRoboto(size: 14, weight: .light)
        return label
    }()
    
    lazy var tempValue: UILabel = {
        let label = UILabel()
        label.text = "12°"
        label.textColor = .white
        label.font = .getRoboto(size: 20, weight: .bold)
        return label
    }()
    
    lazy var weatherImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "sun"))
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        
    }
    
    func setupConstraints() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(tempValue)
        contentView.addSubview(weatherImage)
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.centerX.equalToSuperview()
        }
        
        tempValue.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        weatherImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(22)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
