//
//  CarViewController.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 31/08/21.
//

import UIKit

class CarViewController: UIViewController {
    
    @IBOutlet weak var CarCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CarCollectionView.layer.backgroundColor=UIColor(patternImage: UIImage(named: "bg")!).cgColor
        CarCollectionView.delegate=self
        CarCollectionView.dataSource=self
        CarCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
        CarCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionviewcellidentifier)
    }
}
extension CarViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CarcollectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: collectionviewcellidentifier, for: indexPath) as! MyCollectionViewCell
        cell.ImageCollectioncell.image=CarcollectionArray[indexPath.row].image
        cell.CollectionCellTextLabel.text=CarcollectionArray[indexPath.row].label
    
        return cell
    }
}
extension CarViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size=getItemSize(collectionView: collectionView, collectionViewLayout: collectionViewLayout)
        
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newImageView = UIImageView(image: CarcollectionArray[indexPath.row].image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        newImageView.backgroundColor=UIColor(red: 0.17, green: 0.26, blue: 0.22, alpha: 1.00)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        //self.tabBarController?.tabBar.isHidden = true
    }
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
}
