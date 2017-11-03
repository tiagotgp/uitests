//
//  favourites_movie_appUITests.swift
//  favourites-movie-appUITests
//
//  Created by Goncalves Pereira, Tiago on 11/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import XCTest
import SBTUITestTunnel
import XCTest_Gherkin

class favourites_movie_appUITests: XCTestCase {
    
//    var home_page: Home_Page?
//    var searchResults_page: SearchResults_Page?
//
//    override func setUp() {
//        super.setUp()
//
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        app.launchTunnel()
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//
//        self.home_page = Home_Page(app: app)
//        self.searchResults_page = SearchResults_Page(app: app)
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//        app.stubRequestsRemoveAll()
//    }
//
//    func testFindMoviesButton() {
//        home_page?.findMoviesButton.tap()
//    }
//
//    func testNavigateToSearchResults() {
//        home_page?.findMoviesButton.tap()
//        XCTAssert((searchResults_page?.tableView.exists)!)
//    }
//
//    func testSearchResultsAppear() {
//        home_page?.findMoviesButton.tap()
//        searchResults_page?.enterText(text: "Star Wars", elementIdentifier: "searchMoviesTextField")
//
//        let sr: SBTRequestMatch = SBTRequestMatch.init(url: "https://api.themoviedb.org/3/search/movie\\?api_key=3b45e6afd555c1b95dc09d6469ebc258&query=Star%20Wars")
//        let srs: SBTStubResponse = SBTStubResponse.init(fileNamed: "star_wars_search_results.json")
//
//        app.stubRequests(matching: sr, response: srs)
//
//        searchResults_page?.searchButton.tap()
//
//        XCTAssert((searchResults_page?.getNumberOfCells())! > 0)
//    }
//
//    func testMovieDetailsAreDisplayed() {
//        home_page?.findMoviesButton.tap()
//        searchResults_page?.enterText(text: "Star Wars", elementIdentifier: "searchMoviesTextField")
//        searchResults_page?.searchButton.tap()
//        XCTAssert((searchResults_page?.verifyMovieTitlesAreDisplayed())! && (searchResults_page?.verifyMovieYearsAreDisplayed())! && (searchResults_page?.verifyMovieImagesAreDisplayed())!)
//    }
//
//    func testAddMovieToFavourites() {
//        home_page?.findMoviesButton.tap()
//        searchResults_page?.enterText(text: "Star Wars", elementIdentifier: "searchMoviesTextField")
//        searchResults_page?.searchButton.tap()
//        let index: UInt = (searchResults_page?.getMovieCellIndexByDetails(title: "Star Wars: The Force Awakens", year: "2015-12-15"))!
//        searchResults_page?.addMovieToFavourites(index: index)
//        searchResults_page?.tapBackButton()
//        XCTAssert((home_page?.verifyMovieAddedToFavourites(title: "Star Wars: The Force Awakens", year: "2015-12-15"))!)
//    }
}

