//
//  AeroplaneViewController.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 31/08/21.
//

import UIKit

class AeroplaneViewController: UIViewController {

    @IBOutlet weak var AeroplaneCollectionView: UICollectionView!
    let AeroplaneArray=["aeroplane1","aeroplane2","aeroplane3","aeroplane4","aeroplane5","aeroplane6","aeroplane7","aeroplane8","aeroplane9","aeroplane10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        AeroplaneCollectionView.delegate=self
        AeroplaneCollectionView.dataSource=self

    }

}

extension AeroplaneViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AeroplaneArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell=collectionView.dequeueReusableCell(withReuseIdentifier: "aeroplane", for: indexPath)
        
        let view=UIView()
        view.backgroundColor=UIColor(patternImage: UIImage(named: AeroplaneArray[indexPath.row])!)
        cell.backgroundView=view
        
        return cell
        
    }
    
    
}
extension AeroplaneViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
