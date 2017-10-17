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
    
    static var app: XCUIApplication?
    static var searchButton: XCUIElement? {
        get {
            return app?.buttons["searchMoviesButton"]
        }
    }
    static var tableView: XCUIElement? {
        get {
            return app?.tables["searchResultsTableView"]
        }
    }
    static var textFields: XCUIElementQuery? {
        get {
            return app?.textFields
        }
    }
    
    static func getMovieTitles() -> [String] {
        
        var movieTitles: [String] = []
        
        for movie in (0 ..< self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            guard let movieTitle = self.getMovieDetailsElement(index: number, elementIdentifier: "movieTitle") else { continue }
            movieTitles.append(movieTitle)
        }
        
        return movieTitles
        
    }
    
    static func getMovieYears() -> [String] {
        
        var movieYears: [String] = []
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            guard let movieYear = self.getMovieDetailsElement(index: number, elementIdentifier: "movieYear") else { continue }
            movieYears.append(movieYear)
        }
        
        return movieYears

    }
    
    static func addMovieToFavourites(index: UInt) -> Void {
        self.tableView?.cells.element(boundBy: index).buttons["favouriteButton"].tap()
    }
    
    static func verifyMovieTitlesAreDisplayed() -> Bool {
        return (getMovieTitles().count > 0) ? true : false
    }
    
    static func verifyMovieYearsAreDisplayed() -> Bool {
        return (getMovieYears().count > 0) ? true : false
    }
    
    static func verifyMovieImagesAreDisplayed() -> Bool {
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            guard let tableView = self.tableView else { return false }
            if !tableView.cells.element(boundBy: number).images["movieImage"].exists {
                return false
            }
        }
        return true
    }
    
}
