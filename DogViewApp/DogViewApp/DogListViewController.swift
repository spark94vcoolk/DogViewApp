//
//  ViewController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/16.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.textLabel?.text = dogs[indexPath.row]
        return cell
    }
    
    let dog = Dog()
    
    @IBOutlet weak var DogList: UITableView!
    
    var dogs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DogList.delegate = self
        DogList.dataSource = self
        
        displayDogs()
    }
    
    func displayDogs()  {
        Task{
            let result = await dog.setDogList()
            
            switch result {
                
            case .success(_):
                <#code#>
            case .failure(_):
                <#code#>
            }
            
        }
    }
    
}

