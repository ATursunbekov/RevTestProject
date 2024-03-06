//
//  ViewController.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import UIKit

class MainViewController: UIViewController {

    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        navigationController?.isNavigationBarHidden = true
        mainView.showPlaces.addTarget(self, action: #selector(placesPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        view = mainView
    }
    
    func setupDelegates() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    @objc func placesPressed() {
        print("Something")
        let vc = PlacesViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        if (indexPath.row % 2) == 0 {
            cell.backgroundColor = .purple
        } else {
            cell.contentView.backgroundColor = .green
        }
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        mainView.pageController.currentPage = currentPage
    }
}
