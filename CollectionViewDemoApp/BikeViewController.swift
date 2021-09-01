//
//  BikeViewController.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 31/08/21.
//

import UIKit

class BikeViewController: UIViewController {
    let bikeArray=["bike1","bike2","bike3","bike4","bike5","bike6","bike7","bike8","bike9","bike10"]

    @IBOutlet weak var BikeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BikeCollectionView.delegate=self
        BikeCollectionView.dataSource=self
//        BikeCollectionView.collectionViewLayout=UICollectionViewFlowLayout()

    }


}
extension BikeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bikeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "bike", for: indexPath)
        
        let view=UIView()
        view.backgroundColor=UIColor(patternImage: UIImage(named: self.bikeArray[indexPath.row])!)
        cell.backgroundView=view
        return cell
    }
    
    
}
extension BikeViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView=UIImageView(image: UIImage(named: self.bikeArray[indexPath.row]))
        imageView.frame=UIScreen.main.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled=true
        
        let tap=UITapGestureRecognizer(target: self, action: #selector(dismissFullScreenImage))
        imageView.addGestureRecognizer(tap)
        self.view.addSubview(imageView)
        self.navigationController?.isNavigationBarHidden=true
        
            }
    @objc func dismissFullScreenImage(_ sender:UITapGestureRecognizer){
        self.navigationController?.isNavigationBarHidden=false
        sender.view?.removeFromSuperview()
    }
    
}
