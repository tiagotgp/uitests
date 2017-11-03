//
//  add_movies_to_favourites_steps.swift
//  favourites-movie-appUITests
//
//  Created by Goncalves Pereira, Tiago on 23/10/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import XCTest
import SBTUITestTunnel
import XCTest_Gherkin

class addMoviesToFavouritesSteps: StepDefiner {
    
    override func defineSteps() {
        
        var movieTitle = ""
        
        step("I have searched for (.*)") { (matches: [String]) in
            let searchTerm = matches.first!
            
            Home_Page.findMoviesButton?.tap()
            SearchResults_Page.enterText(text: searchTerm, elementIdentifier: "searchMoviesTextField")
            
            MockData.mockResponse(app: super.test.app!, requestURL: "https://api.themoviedb.org/3/search/movie\\?api_key=3b45e6afd555c1b95dc09d6469ebc258&query=Star%20Wars", responseFile: "star_wars_search_results.json")
            
            SearchResults_Page.searchButton?.tap()
        }
        
        step("I add (.*) to favourites") { (matches: [String]) in
            movieTitle = matches.first!
            
            let index: UInt = (SearchResults_Page.getMovieCellIndexByTitle(title: movieTitle))!
            SearchResults_Page.addMovieToFavourites(index: index)
        }
        
        step("I should see the movie in the favourites list") {
            SearchResults_Page.tapBackButton()
            XCTAssert(Home_Page.verifyMovieAddedToFavourites(title: movieTitle))
        }
    }
}
