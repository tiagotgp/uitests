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
        
        step("Given I'm viewing the search results section") {
            
            Home_Page.findMoviesButton?.tap()
        }
        
        step("When I search for (.*)") { (matches: [String]) in
            let movieName = matches.first!
            SearchResults_Page.enterText(text: movieName, elementIdentifier: "searchMoviesTextField")
            
            MockData.mockResponse(app: super.test.app!, requestURL: "https://api.themoviedb.org/3/search/movie\\?api_key=3b45e6afd555c1b95dc09d6469ebc258&query=Star%20Wars", responseFile: "star_wars_search_results.json")
            
            SearchResults_Page.searchButton?.tap()
        }
        
        step("Then I should see search results") {
//            XCTAssert(SearchResults_Page.getNumberOfCells() > 0)
            XCTAssert(false)
        }
    }
}
