//
//  BrandViewController.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 1/3/22.
//

import UIKit

class BrandViewController: UIViewController {

    @IBOutlet weak var brandCollectionView: UICollectionView!
    var dummy = ["Brandy","Mixer","Brandy","Mixer","Brandy","Mixer","Mixer","Brandy","Mixer","Mixer","Brandy","Mixer","Brandy","Mixer","Mixer","Brandy","Mixer"]
    override func viewDidLoad() {
        super.viewDidLoad()

      configureCollectionView()
    }
    private func configureCollectionView() {
        brandCollectionView.delegate = self
        brandCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 65)
        layout.scrollDirection = .horizontal
        brandCollectionView.collectionViewLayout = layout
        brandCollectionView.showsHorizontalScrollIndicator = false
    }
}

extension BrandViewController: UICollectionViewDataSource,
                               UICollectionViewDelegate,
                               UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let title = dummy[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as! BrandCollectionViewCell
        cell.bind(title)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 65)
    }
}
