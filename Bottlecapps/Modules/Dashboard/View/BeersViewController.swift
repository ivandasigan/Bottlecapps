//
//  BeersViewController.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/3/22.
//

import UIKit

class BeersViewController: UIViewController {

    @IBOutlet weak var beersCollectionView: UICollectionView!
    let beers : [Beer] = [
        Beer(id: 1, name: "Brandy Coffe", size: "120ml", srp: "20.0", stock: 10, ratings: "4.1"),
        Beer(id: 2, name: "Brandy Coffe", size: "120ml", srp: "20.0", stock: 10, ratings: "4.1"),
        Beer(id: 3, name: "Brandy Coffe", size: "120ml", srp: "20.0", stock: 10, ratings: "4.1"),
        Beer(id: 4, name: "Brandy Coffe", size: "120ml", srp: "20.0", stock: 10, ratings: "4.1"),
        Beer(id: 5, name: "Brandy Coffe", size: "120ml", srp: "20.0", stock: 10, ratings: "4.1"),
        Beer(id: 6, name: "Brandy Coffe", size: "120ml", srp: "20.0", stock: 10, ratings: "4.1"),
    ]
    
    var width: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    
    }
    
    private func configureCollectionView() {
        beersCollectionView.delegate = self
        beersCollectionView.dataSource = self
        
        width = (beersCollectionView.frame.width / 2) - 30
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: 200)
        layout.scrollDirection = .vertical
        beersCollectionView.collectionViewLayout = layout
        beersCollectionView.showsVerticalScrollIndicator = false
    }
}

extension BeersViewController: UICollectionViewDelegate,
                               UICollectionViewDataSource ,
                               UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let beer = beers[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerCollectionViewCell.identifier, for: indexPath) as! BeerCollectionViewCell
        cell.bind(beer)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: 200)
    }
    
}
