//
//  AeroplaneViewController.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 31/08/21.
//

import UIKit

class AeroplaneViewController: UIViewController {
    
    @IBOutlet weak var AeroplaneCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AeroplaneCollectionView.layer.backgroundColor=UIColor(patternImage: UIImage(named: "bg")!).cgColor
        AeroplaneCollectionView.delegate=self
        AeroplaneCollectionView.dataSource=self
        AeroplaneCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionviewcellidentifier)
        AeroplaneCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
    }
}
extension AeroplaneViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AeroplaneCollectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell=collectionView.dequeueReusableCell(withReuseIdentifier: collectionviewcellidentifier, for: indexPath) as! MyCollectionViewCell
        
        cell.ImageCollectioncell.image=AeroplaneCollectionArray[indexPath.row].image
        cell.CollectionCellTextLabel.text=AeroplaneCollectionArray[indexPath.row].label
        return cell
    }
}
extension AeroplaneViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size=getItemSize(collectionView: collectionView, collectionViewLayout: collectionViewLayout)
//        let nbCol = 2
//            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//            let totalSpace = flowLayout.sectionInset.left
//                + flowLayout.sectionInset.right
//                + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 1))
//            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
            return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView=UIImageView(image: AeroplaneCollectionArray[indexPath.row].image)
        imageView.frame=UIScreen.main.bounds
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled=true
        imageView.backgroundColor=UIColor(red: 0.17, green: 0.26, blue: 0.22, alpha: 1.00)
        self.navigationController?.isNavigationBarHidden=true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImage)))
        self.view.addSubview(imageView)
    }
    @objc func didTapImage(_ sender:UITapGestureRecognizer)
    {//dismiss image
        self.navigationController?.isNavigationBarHidden=false
        sender.view?.removeFromSuperview()
    }

    
}
