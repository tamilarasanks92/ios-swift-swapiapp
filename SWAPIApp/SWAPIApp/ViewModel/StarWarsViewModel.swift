//
//  StarWarsViewModel.swift
//  SWAPIApp
//
//  Created by aspire on 9/15/20.
//  Copyright © 2020 aspire. All rights reserved.
//

import Foundation
import Alamofire

// StarWars View Model to interact between StarWars Model and View(HomeViewController) of the class
class StarWarsViewModel {
    var characters: [SWCharacter]? = nil
    init(model: [SWCharacter]? = nil) {
        if let inputModel = model {
            characters = inputModel
        }
    }
}

// Each character of the StarWars model will be stored in this model
extension StarWarsViewModel {
    /**
    This method will fetch StarWars character from API and store it in Model

    - Parameters:
       - completion: Completion handler will let you know whether data has been retrieved successfully
    */
    func fetchSWCharcters(completion: @escaping ([SWCharacter]) -> Void) {
        let request = AF.request("https://swapi.dev/api/people/")
        request.responseDecodable(of: StarWarsModel.self) {(response) in
            guard let characters = response.value?.characters else {
                print("Invalid URL")
                return
            }
            self.characters = characters
            completion(characters)
        }
    }
}
