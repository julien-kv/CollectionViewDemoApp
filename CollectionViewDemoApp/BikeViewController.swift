//
//  BikeViewController.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 31/08/21.
//

import UIKit

class BikeViewController: UIViewController {
    @IBOutlet weak var BikeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BikeCollectionView.layer.backgroundColor=UIColor(patternImage: UIImage(named: "bg")!).cgColor
        BikeCollectionView.delegate=self
        BikeCollectionView.dataSource=self
        BikeCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
        BikeCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reusablecell")
    }
}
extension BikeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BikeCollectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "reusablecell", for: indexPath) as! MyCollectionViewCell
        cell.ImageCollectioncell.image=BikeCollectionArray[indexPath.row].image
        cell.CollectionCellTextLabel.text=BikeCollectionArray[indexPath.row].label
        
        return cell
    }
    
    
}
extension BikeViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let nbCol = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView=UIImageView(image: BikeCollectionArray[indexPath.row].image)
        imageView.frame=UIScreen.main.bounds
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled=true
        imageView.backgroundColor=UIColor(red: 0.17, green: 0.26, blue: 0.22, alpha: 1.00)
        let tap=UITapGestureRecognizer(target: self, action: #selector(dismissFullScreenImage))
        imageView.addGestureRecognizer(tap)
        self.view.addSubview(imageView)
        self.view.backgroundColor=UIColor(red: 0.17, green: 0.26, blue: 0.22, alpha: 1.00)
        self.navigationController?.isNavigationBarHidden=true
        
            }
    @objc func dismissFullScreenImage(_ sender:UITapGestureRecognizer){
        self.navigationController?.isNavigationBarHidden=false
        sender.view?.removeFromSuperview()
    }
    
}
