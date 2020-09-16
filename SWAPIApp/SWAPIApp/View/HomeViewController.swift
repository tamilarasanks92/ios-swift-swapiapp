//
//  ViewController.swift
//  SWAPIApp
//
//  Created by aspire on 9/15/20.
//  Copyright © 2020 aspire. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var swCharactersTableView: UITableView!
    var starWarsViewModel = StarWarsViewModel()
    
    /**
     Called after the controller's view is loaded into memory.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Star Wars"
        navigationController?.navigationBar.prefersLargeTitles = true
        starWarsViewModel.fetchSWCharcters{ (characters) in
            DispatchQueue.main.async {
                self.swCharactersTableView.reloadData()
            }
        }
    }
}

// MARK: - Table view delagate & data source
/**
 Custom estension to communicate Table View and update rows and if gets selected sould navigate to Details Screen
*/
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsViewModel.characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sw_characters_id")
        cell?.textLabel?.text = starWarsViewModel.characters?[indexPath.row].name
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            vc.swCharacter = starWarsViewModel.characters?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

