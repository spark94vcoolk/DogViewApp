//
//  ViewController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/16.
//

import UIKit

class DogListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var dogResponce: dogResponce?
    let dog = Dog()
    var dogs: [String] = []
    var selectedDogName: String?
    
    @IBOutlet weak var DogList: UITableView!
    
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
            case .success(let response):
                self.dogResponce = response
                self.dogs = response.message.keys.sorted()
                self.DogList.reloadData()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogResponce?.message.count ?? 0//ここのコードを確認
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.textLabel?.text = dogs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDogName = dogs[indexPath.row]
        performSegue(withIdentifier: "toCollection", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollection" {
            if let destinationVC = segue.destination as? DogImageCollectionViewController {
                destinationVC.selectedDogName = selectedDogName
                
            }
        }
    }
    
}
