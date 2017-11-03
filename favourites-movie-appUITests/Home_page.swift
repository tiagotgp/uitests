//
//  Home_page.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 11/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation
import XCTest

class Home_Page: App, HasTableView {
    
    static var app: XCUIApplication?
    static var tableView: XCUIElement? {
        get {
            return app?.tables["movieTableView"]
        }
    }
    static var findMoviesButton: XCUIElement? {
        get {
            return app?.buttons["findMoviesButton"]
        }
    }
    
    static func verifyMovieAddedToFavourites(title: String, year: String) -> Bool {
        for movie in (0 ..< self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            if getMovieDetailsElement(index: number, elementIdentifier: "movieTitle") == title && getMovieDetailsElement(index: number, elementIdentifier: "movieYear") == year {
                return true
            }
        }
        return false
    }
    
    static func verifyMovieAddedToFavourites(title: String) -> Bool {
        for movie in (0 ..< self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            
            if getMovieDetailsElement(index: number, elementIdentifier: "movieTitle") == title {
                return true
            }
        }
        return false
    }
    
}
