//
//  WeatherUITableViewCell.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 6/3/24.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "12°"
        label.font = UIFont(name: "Roboto-Medium", size: 64)
        label.textColor = .white
        
        return label
    }()
    
    lazy var celsiusLabel: UILabel = {
        let label = UILabel()
        label.text = "c"
        label.font = UIFont(name: "Roboto-Medium", size: 32)
        label.textColor = .white
        
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Bishkek"
        label.font = UIFont(name: "Roboto-Medium", size: 36)
        label.textColor = .white
        
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "17:45 PM"
        label.font = UIFont(name: "Roboto-Thin", size: 16)
        label.textColor = .white
        
        return label
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "basket"), for: .normal)
        
        return button
    }()
    
    lazy var weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.sizeToFit()
        image.image = UIImage(named: "partlyCloudy")
        
        return image
    }()
    
    lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Partly cloudy"
        label.font = UIFont(name: "Roboto-Light", size: 18)
        label.textColor = .white
        
        return label
    }()
    
    lazy var dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#889DCE")
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(tempLabel)
        addSubview(celsiusLabel)
        addSubview(cityLabel)
        addSubview(timeLabel)
        addSubview(deleteButton)
        addSubview(weatherImage)
        addSubview(weatherLabel)
        addSubview(dividerLine)
    }
    
    func setupConstraints() {
        tempLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(23))
            make.leading.equalToSuperview().inset(dWidth(40))
        }
        
        celsiusLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(23))
            make.leading.equalTo(tempLabel.snp.trailing).offset(dWidth(4))
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(102))
            make.leading.equalToSuperview().inset(dWidth(40))
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(148))
            make.leading.equalToSuperview().inset(dWidth(40))
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(dWidth(24))
            make.width.height.equalTo(dWidth(24))
        }
        
        weatherImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(29.5))
            make.trailing.equalToSuperview().inset(dWidth(52))
            make.width.equalTo(dWidth(147.55))
            make.height.equalTo(dHeight(100))
        }
        
        weatherLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(dHeight(37.5))
            make.centerX.equalTo(weatherImage.snp.centerX)
        }
        
        dividerLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(dHeight(8))
            make.leading.trailing.equalToSuperview().inset(dWidth(24))
            make.height.equalTo(dHeight(1))
        }
    }
}
