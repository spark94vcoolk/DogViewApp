//
//  ViewController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/28.
//

import UIKit
import Alamofire
import AlamofireImage

class DogDetailViewController: UIViewController {
    
    var imageURL: URL?
    
    @IBOutlet weak var detailDogImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = imageURL {
            AF.request(imageURL).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    self?.detailDogImage.image = image
                case .failure(let error):
                    print("Error loading image: \(error)")
                }
            }
        }
        
    }
    
}
