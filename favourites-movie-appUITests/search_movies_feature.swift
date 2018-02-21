//
//  search_movies_feature.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 12/10/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import XCTest
import XCTest_Gherkin
import SBTUITestTunnel

class testSearchMovies: Feature {
    
    private func background() {
        Given("I'm viewing the search results section")
    }
    
    func testViewResults() {
        self.background()
        When("I search for Star Wars")
        Then("I should see search results")
    }
    
    func testNoMoviesFound() {
        self.background()
        When("I make a search that yields no results")
        Then("I should be notified that no movies were found")
    }
}
