//
//  SWFilmsViewModel.swift
//  SWAPIApp
//
//  Created by aspire on 9/16/20.
//  Copyright © 2020 aspire. All rights reserved.
//

import Foundation
import Alamofire

// ViewModel to interact between SWFilmModel and DetailViewController
class SWFilmViewModel {
    private var films = [SWFilmModel]()
    private var filmUrls = [String]()
    init(films: [String]? = nil) {
        if let inputModel = films {
            filmUrls = inputModel
        }
    }
}

extension SWFilmViewModel {
    /**
    This method will fetch StarWars characters each film from API and send it to fetchSWFilms

    - Parameters:
       - completion: Completion handler will let you know whether data has been retrieved successfully
    */
    private func fetchSWFilm(for url: String,completion: @escaping (SWFilmModel) -> Void) {
        let request = AF.request(url)
        request.responseDecodable(of: SWFilmModel.self) {(response) in
            guard let film = response.value else {
                print("Invalid URL")
                return
            }
            completion(film)
        }
    }
    
    /**
    This method will fetch StarWars films from fetchSWFilm and store it in Model

    - Parameters:
       - completion: Completion handler will let you know whether data has been retrieved successfully
    */
    func fetchSWFilms(completion: @escaping ([SWFilmModel]) -> Void) {
        for filmName in filmUrls {
            self.fetchSWFilm(for: filmName, completion: { (film) in
                self.films.append(film)
                if self.films.count == self.filmUrls.count {
                    completion(self.films)
                }
            })
        }
    }
    
    /**
    This method will send list of filmNames stored in Model
    */
    func getFilmNames() -> [String] {
        var tmpFilmNameArr = [String]()
        for film in films {
            tmpFilmNameArr.append(film.title)
        }
        return tmpFilmNameArr
    }
    
    func getOpeningCrawlCount(of index: Int) -> Int {
        var count = 0
        return self.films[index].opening_crawl.count
    }
}
