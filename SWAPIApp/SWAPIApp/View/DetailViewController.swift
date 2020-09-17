//
//  DetailViewController.swift
//  SWAPIApp
//
//  Created by aspire on 9/15/20.
//  Copyright © 2020 aspire. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var swCharacter: SWCharacter? = nil
    @IBOutlet weak var lblBirthYearHeader: UILabel!
    @IBOutlet weak var lblBirthYear: UILabel!
    @IBOutlet weak var lblHeightHeader: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblMassHeader: UILabel!
    @IBOutlet weak var lblMass: UILabel!
    @IBOutlet weak var lblHairColorHeader: UILabel!
    @IBOutlet weak var lblHairColor: UILabel!
    @IBOutlet weak var lblSkinColorHeader: UILabel!
    @IBOutlet weak var lblSkinColor: UILabel!
    @IBOutlet weak var lblEyeColorHeader: UILabel!
    @IBOutlet weak var lblEyeColor: UILabel!
    @IBOutlet weak var lblGenderHeader: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var swFilmsTableView: UITableView!
    
    var swFilmViewModel: SWFilmViewModel? = nil
    var filmNames = [String]()
    
    /**
     Called after the controller's view is loaded into memory.
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .never
        guard let character = swCharacter else {
            print("Error: Unable to fetch StarWars character details")
            return
        }
        title = "\(character.name)"
        self.updateUI(character)
        swFilmViewModel = SWFilmViewModel(films: character.films)
        swFilmViewModel?.fetchSWFilms { (films) in
            guard let filmNames = self.swFilmViewModel?.getFilmNames() else {
                print("Error: Unable to fetch Film names")
                return
            }
            DispatchQueue.main.async {
                self.filmNames = filmNames
                self.swFilmsTableView.reloadData()
                self.swFilmsTableView.easeoutAnimation()
            }
        }
    }
    
    /**
     Notifies the view controller that its view was going to be added to a view hierarchy.

     - Parameters:
        - animated: If true, the view was added to the window using an animation.
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblBirthYear.easeoutAnimation(from: .Right)
        lblHeight.easeoutAnimation(from: .Right)
        lblMass.easeoutAnimation(from: .Right)
        lblHairColor.easeoutAnimation(from: .Right)
        lblSkinColor.easeoutAnimation(from: .Right)
        lblEyeColor.easeoutAnimation(from: .Right)
        lblGender.easeoutAnimation(from: .Right)
        lblBirthYearHeader.easeoutAnimation()
        lblHeightHeader.easeoutAnimation()
        lblMassHeader.easeoutAnimation()
        lblHairColorHeader.easeoutAnimation()
        lblSkinColorHeader.easeoutAnimation()
        lblEyeColorHeader.easeoutAnimation()
        lblGenderHeader.easeoutAnimation()
        
    }
    
    /**
    This method updates UI Labels with appropriate texts

    - Parameters:
       - character: Contains information related to StarWars character
    */
    func updateUI(_ character: SWCharacter) {
        lblBirthYear.text = character.birth_year
        lblHeight.text = character.height
        lblMass.text = character.mass
        lblHairColor.text = character.hair_color
        lblSkinColor.text = character.skin_color
        lblEyeColor.text = character.eye_color
        lblGender.text = character.gender
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Table view data source
/**
 Custom estension to communicate Table View and update rows
*/
extension DetailViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filmNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sw_films_id")
        cell?.textLabel?.text = self.filmNames[indexPath.row]
        cell?.detailTextLabel?.text = "\(swFilmViewModel?.getOpeningCrawlCount(of: indexPath.row) ?? 0)"
        return cell ?? UITableViewCell()
    }
    
    
}
