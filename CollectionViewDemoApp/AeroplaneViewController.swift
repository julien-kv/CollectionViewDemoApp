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
        //AeroplaneCollectionView.backgroundColor=UIColor(r)
        AeroplaneCollectionView.delegate=self
        AeroplaneCollectionView.dataSource=self
        //AeroplaneCollectionView.collectionViewLayout=UICollectionViewFlowLayout()
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView=UIImageView(image: UIImage(named: AeroplaneArray[indexPath.row]))
        imageView.frame=UIScreen.main.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled=true
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
