//
//  PlacesView.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 6/3/24.
//

import UIKit
import SnapKit

class PlacesView: UIView {
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add"), for: .normal)
        
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 32)
        label.text = "Regional Weather"
        label.textColor = .white
        
        return label
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for: .normal)
        
        return button
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.separatorStyle = .none
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        let color1 = UIColor(hex: "#FFFFFF").cgColor
        let color2 = UIColor(hex: "#7EA9E9").cgColor
        let color3 = UIColor(hex: "#131C6C").cgColor
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.locations = [0.0, 0.02, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
        addSubview(addButton)
        addSubview(titleLabel)
        addSubview(menuButton)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(60))
            make.leading.equalToSuperview().inset(dWidth(24))
            make.width.height.equalTo(dWidth(40))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(60))
            make.centerX.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(60))
            make.trailing.equalToSuperview().inset(dWidth(24))
            make.width.height.equalTo(dWidth(40))
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(dHeight(118))
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
