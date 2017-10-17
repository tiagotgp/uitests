//
//  SearchResults_page.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago (Tester) on 11/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago (Tester). All rights reserved.
//

import Foundation

import XCTest

class SearchResults_Page: App, HasTableView, HasTextFields {
    
    let app: XCUIApplication
    let searchButton: XCUIElement
    var tableView: XCUIElement
    var textFields: XCUIElementQuery

    init(app: XCUIApplication) {
        self.app = app
        self.tableView = app.tables["searchResultsTableView"]
        self.searchButton = app.buttons["searchMoviesButton"]
        self.textFields = app.textFields
    }
    
    func getMovieTitles() -> [String] {
        
        var movieTitles: [String] = []
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            movieTitles.append((getMovieDetailsElement(index: number, elementIdentifier: "movieTitle")))
        }
        
        return movieTitles
        
    }
    
    func getMovieYears() -> [String] {
        
        var movieYears: [String] = []
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            movieYears.append((getMovieDetailsElement(index: number, elementIdentifier: "movieYear")))
        }
        
        return movieYears

    }
    
    func addMovieToFavourites(index: UInt) -> Void {
        self.tableView.cells.element(boundBy: index).buttons["favouriteButton"].tap()
    }
    
    func verifyMovieTitlesAreDisplayed() -> Bool {
        return (getMovieTitles().count > 0) ? true : false
    }
    
    func verifyMovieYearsAreDisplayed() -> Bool {
        return (getMovieYears().count > 0) ? true : false
    }
    
    func verifyMovieImagesAreDisplayed() -> Bool {
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            if !self.tableView.cells.element(boundBy: number).images["movieImage"].exists {
                return false
            }
        }
        return true
    }
    
}
