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
    
    
    var dogImages: [URL] = []
    var selectedDogName: String?
    
    @IBOutlet weak var dogImageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dogName = selectedDogName {
            navigationItem.title = dogName
            
        }
        Task{
            await fetchDogImege()
        }
    }
    
    func fetchDogImege() async {
        guard let dogName = selectedDogName else {
            return
        }
        
        let urlString = "https://dog.ceo/api/breed/\(dogName)/images"
        
        do {
            let response = try await AF.request(urlString).serializingDecodable(DogImagesResponse.self).value
            print(response)
            dogImages = response.message.compactMap { URL(string: $0) }
            dogImageCollection.reloadData()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toCollection", for: indexPath) as? DogCollectionViewCell else {
            let errorCelll = UICollectionViewCell()
            return UICollectionViewCell()
        }
        cell.configure(with: dogImages[indexPath.item])
        return cell
    }
    
}
