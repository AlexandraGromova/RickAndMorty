//
//  ListPersonViewController.swift
//  RickAndMortyApp
//
//  Created by Sasha on 19.10.2022.
//

import UIKit

class ListPersonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var charackters: [Result] = []
    var name = ""
    var countPers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        print("viewDidLoad")
    }
    
    func makeRequest(){
        var request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)
        let task = URLSession.shared.dataTask(with: request) {data, response, error  in
            if let data = data,
               let response = try? JSONDecoder().decode(Response.self, from: data) {
                DispatchQueue.main.async { [self] in
                    name = response.results[1].name
                    charackters = response.results
                    tableView.reloadData()
                }
            }
        }
        task.resume()
        print("makeRequest")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "goToPerson") as? PersonViewController else { return }
        vc.index = indexPath.row
        vc.persons = charackters
//        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.show(vc, sender: nil)
        
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("makeRequestCount")
        return charackters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = self.charackters[indexPath.row].name
        cell.textLabel?.textColor = UIColor(named: "DarkGreen")
        cell.backgroundColor = .black
        print("tableViewCell")
        return cell
    }

}

class TableViewCell: UITableViewCell {
}
