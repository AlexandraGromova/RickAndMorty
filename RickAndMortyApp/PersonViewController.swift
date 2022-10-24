//
//  PersonViewController.swift
//  RickAndMortyApp
//
//  Created by Sasha on 19.10.2022.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var DescriptionLable: UILabel!
    @IBOutlet weak var NamePersonLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet var ViewPerson: UIView!
    var persons: [Result] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NamePersonLabel.text = persons[index].name
        DescriptionLable.text =
        persons[index].created + "\n" +
        persons[index].gender.rawValue + "\n" +
        persons[index].status.rawValue + "\n" +
        persons[index].species.rawValue
        transferImage(str: persons[index].image)
        
    }
    
    func transferImage(str: String){
        let url = URL(string: str)
        if let data = try? Data(contentsOf: url!) {
            ImageView.image = UIImage(data: data)}
    }
    
    
}
