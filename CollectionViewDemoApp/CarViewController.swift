//
//  CarViewController.swift
//  CollectionViewDemoApp
//
//  Created by Julien on 31/08/21.
//

import UIKit

class CarViewController: UIViewController {
    let carArray=["car1","car2","car3","car4","car5","car6","car7","car8","car9","car10"]    
    @IBOutlet weak var CarCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CarCollectionView.layer.backgroundColor=UIColor(patternImage: UIImage(named: "bg")!).cgColor
        // Do any additional setup after loading the view.
        CarCollectionView.delegate=self
        CarCollectionView.dataSource=self
        CarCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
    }
}
extension CarViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "car", for: indexPath)
        let view=UIView()
        view.backgroundColor=UIColor(patternImage: UIImage(named: self.carArray[indexPath.row])!)
        cell.layer.cornerRadius=5
        cell.backgroundView=view
//        cell.layer.borderColor=UIColor.black.cgColor
//        cell.layer.borderWidth=2
        return cell
    }
}
extension CarViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newImageView = UIImageView(image: UIImage(named: self.carArray[indexPath.row]))
        newImageView.frame = UIScreen.main.bounds
        newImageView.contentMode = .scaleAspectFill
        newImageView.isUserInteractionEnabled = true
        
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
