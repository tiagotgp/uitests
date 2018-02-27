//
//  SearchResults_page.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 11/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation
import XCTest

class SearchResults_Page: App, HasMoviesTableView, HasTextFields {
    
    static let searchMoviesButtonIdentifier = "searchMoviesButton"
    static let searchResultsTableViewIdentifier = "searchResultsTableView"
    static let searchMoviesTextFieldIdentifier = "searchMoviesTextField"
    
    static var app: XCUIApplication?
    static var searchButton: XCUIElement? {
        get {
            return app?.buttons[searchMoviesButtonIdentifier]
        }
    }
    static var tableView: XCUIElement? {
        get {
            return app?.tables[searchResultsTableViewIdentifier]
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
            guard let movieTitle = self.getMovieDetailsElement(index: number, elementIdentifier: MovieElementIdentifiers.movieTitle) else { continue }
            movieTitles.append(movieTitle)
        }
        return movieTitles
    }
    
    static func getMovieYears() -> [String] {
        
        var movieYears: [String] = []
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            guard let movieYear = self.getMovieDetailsElement(index: number, elementIdentifier: MovieElementIdentifiers.movieYear) else { continue }
            movieYears.append(movieYear)
        }
        return movieYears
    }
    
    static func addMovieToFavourites(index: UInt) -> Void {
        self.tableView?.cells.element(boundBy: index).buttons[MovieElementIdentifiers.favouriteButton].tap()
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
            if !tableView.cells.element(boundBy: number).images[MovieElementIdentifiers.movieImage].exists {
                return false
            }
        }
        return true
    }
    
    static func verifyNoMoviesAlertIsDisplayed() -> Void {
        
        let expectedAlertTitle = "No movies found"
        let expectedAlertMessage = "Search has not found the movies you requested"
        
        let actualAlertTitle = (app?.alerts.staticTexts.allElementsBoundByIndex[0].label)!
        let actualAlertMessage = (app?.alerts.staticTexts.allElementsBoundByIndex[1].label)!
        
        XCTAssert(expectedAlertTitle == actualAlertTitle && expectedAlertMessage == actualAlertMessage, "Incorrect copy text: Acutal: \(actualAlertTitle) - \(actualAlertMessage) Expected: \(expectedAlertTitle) - \(expectedAlertMessage)")
    }
    
    static func verifySearchResultsAreDisplayed() -> Void {
        XCTAssert(SearchResults_Page.getNumberOfCells() > 0, "No search results were found")
    }
    
}
