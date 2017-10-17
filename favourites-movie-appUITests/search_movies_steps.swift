//
//  search_movies_steps.swift
//  favourites-movie-appUITests
//
//  Created by Goncalves Pereira, Tiago (Tester) on 16/10/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago (Tester). All rights reserved.
//

import XCTest
import SBTUITestTunnel
import XCTest_Gherkin

class SearchMoviesSteps: StepDefiner {
    
    override func defineSteps() {
        
        let app = super.test.app
        app?.launchTunnel()
        let home_page = Home_Page(app: app!)
        let searchResults_page = SearchResults_Page(app: app!)
        
        step("Given I'm viewing the search results section") {
            home_page.findMoviesButton.tap()
        }
        
        step("When I search for (.*)") { (matches: [String]) in
            let movieName = matches.first!
            searchResults_page.enterText(text: movieName, elementIdentifier: "searchMoviesTextField")
            
            MockData.mockResponse(app: app!, requestURL: "https://api.themoviedb.org/3/search/movie\\?api_key=3b45e6afd555c1b95dc09d6469ebc258&query=Star%20Wars", responseFile: "star_wars_search_results.json")
            
            searchResults_page.searchButton.tap()
        }
        
        step("Then I should see search results") {
            XCTAssert((searchResults_page.getNumberOfCells()) > 0)
        }
    }
}
