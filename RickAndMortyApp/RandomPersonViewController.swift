//
//  RandomPersonViewController.swift
//  RickAndMortyApp
//
//  Created by Sasha on 19.10.2022.
//

import UIKit

class RandomPersonViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var DescriptionLable: UILabel!
    @IBOutlet weak var NamePersLabel: UILabel!
    @IBOutlet weak var RandomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func makeRequest(num: Int){
        var request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error  in
            if let data = data,
               let response = try? JSONDecoder().decode(Response.self, from: data)
            {
                DispatchQueue.main.async {
                    self.NamePersLabel.text = response.results[num].name
                    self.DescriptionLable.text =
                        response.results[num].created + "\n" +
                        response.results[num].gender.rawValue + "\n" +
                        response.results[num].status.rawValue + "\n" +
                        response.results[num].species.rawValue
                    self.transferImage (str: response.results[num].image)
                    var info = response.results
                }
            }
        }
        task.resume()
    }
    
    func transferImage(str: String){
        let url = URL(string: str)
            if let data = try? Data(contentsOf: url!)
            {
                ImageView.image = UIImage(data: data)}
    }
    
    @IBAction func tapRandomButton(_ sender: UIButton) {
        let randomInt = Int.random(in: 0..<20)
        makeRequest(num: randomInt)
    }

}
