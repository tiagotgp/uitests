//
//  HasMoviesTableView.swift
//  favourites-movie-appUITests
//
//  Created by Goncalves Pereira, Tiago (Tester) on 27/02/2018.
//  Copyright © 2018 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation
import XCTest

protocol HasMoviesTableView: HasTableView {
}

extension HasMoviesTableView {
    static func getMovieDetailsElement(index: UInt, elementIdentifier: String) -> String? {
        return tableView?.cells.element(boundBy: index).staticTexts[elementIdentifier].label.description
    }
    
    static func getMovieCellIndexByDetails(title: String, year: String) -> UInt? {
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            if (getMovieDetailsElement(index: number, elementIdentifier: MovieElementIdentifiers.movieTitle)) == title && getMovieDetailsElement(index: number, elementIdentifier: year) == year {
                return number
            }
        }
        
        XCTFail("Cannot find movie: title: \(title) - year: \(year)")
        return nil
    }
    
    static func getMovieCellIndexByTitle(title: String) -> UInt? {
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            if (getMovieDetailsElement(index: number, elementIdentifier: MovieElementIdentifiers.movieTitle)) == title {
                return number
            }
        }
        
        XCTFail("Cannot find movie: title: \(title)")
        return nil
    }
    
}
