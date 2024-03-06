//
//  PlacesViewController.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 6/3/24.
//

import UIKit
import SnapKit

class PlacesViewController: UIViewController {
    
    private let contentView = PlacesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    var cityCount = 10
    
    func setupView() {
        contentView.tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.menuButton.addTarget(self, action: #selector(menuButtonPressed), for: .touchUpInside)
        navigationController?.navigationBar.isUserInteractionEnabled = false
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func menuButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc func deleteButtonPressed(sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: contentView.tableView)
        if let indexPath = contentView.tableView.indexPathForRow(at: point) {
            contentView.tableView.beginUpdates()
            contentView.tableView.deleteRows(at: [indexPath], with: .fade)
            cityCount -= 1
            contentView.tableView.endUpdates()
        }
    }
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonPressed(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 198
    }
}
