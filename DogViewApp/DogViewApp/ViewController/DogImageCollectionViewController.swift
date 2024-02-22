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
    var breeds: [String] = []
    var DogCollectionImage: [String] = []
    var selectedDogName: String?
    
    @IBOutlet weak var dogImageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogImageCollection.delegate = self
        dogImageCollection.dataSource = self
        
        if let dogName = selectedDogName {
            navigationItem.title = dogName
            fetchDogImege(for: dogName)
        }
    }
    
    func fetchDogImege(for dogName: String) {
        let urlString = "https://dog.ceo/api/breed/\(dogName)/images"
    print(urlString)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogResponce?.message.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toCollection", for: indexPath) as? DogCollectionViewCell else {
            let errorCelll = UICollectionViewCell()
            return errorCelll
        }
        return cell
    }
    
    
}
