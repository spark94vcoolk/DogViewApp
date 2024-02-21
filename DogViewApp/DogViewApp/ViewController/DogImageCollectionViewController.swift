//
//  DogImageCollectionViewController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/20.
//

import UIKit
import Alamofire
import AlamofireImage

class DogImageCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var dogResponce: dogResponce?
    var dogs: [String] = []
    var selectedDogName: String?
    
    @IBOutlet weak var dogImageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dogName = selectedDogName {
            navigationItem.title = dogName
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toCollection", for: indexPath) as? DogCollectionViewCell else {
            let errorCelll = UICollectionViewCell()
            return errorCelll
        }
        return cell
    }
}