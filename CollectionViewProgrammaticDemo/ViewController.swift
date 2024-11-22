//
//  ViewController.swift
//  CollectionViewProgrammaticDemo
//
//  Created by Matthew Dolan on 2024-11-21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let data = Array(1...20)
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Add collectionView to the view hierarchy
        view.addSubview(collectionView)
        
        // Add collectionView constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        // Set the delegate and dataSource
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register a cell class
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.imageView.image = UIImage(named: "sun-hung-DkBT63dM684-unsplash.jpg")
        cell.titleLabel.text = "Item \(indexPath.row + 1)"
        cell.titleLabel.textColor = .systemPink
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        // Assign different sizes dynamically
        if indexPath.row % 3 == 0 {
            // Larger cell
            return CGSize(width: width / 2, height: width / 2)
        } else {
            // Smaller cell
            return CGSize(width: width / 3, height: width / 3)
        }
    }
}
