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
    
    static func verifyMovieAddedToFavourites(title: String, year: String) -> Void {
        for movie in (0 ..< self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            if getMovieDetailsElement(index: number, elementIdentifier: "movieTitle") == title && getMovieDetailsElement(index: number, elementIdentifier: "movieYear") == year {
                return
            }
        }
        XCTFail("Selected movie: \(title) was not added to favourites")
    }
    
    static func verifyMovieAddedToFavourites(title: String) -> Void {
        for movie in (0 ..< self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            
            if getMovieDetailsElement(index: number, elementIdentifier: "movieTitle") == title {
                return
            }
        }
        XCTFail("Selected movie: \(title) was not added to favourites")
        
        
    }
    
}
