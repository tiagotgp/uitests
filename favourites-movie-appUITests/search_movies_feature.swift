//
//  search_movies_feature.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago (Tester) on 12/10/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago (Tester). All rights reserved.
//

import XCTest
import XCTest_Gherkin
import SBTUITestTunnel

class Feature: XCTestCase {
    
    override func setUp() {
        
        Home_Page.app = super.app
        SearchResults_Page.app = super.app
        
        super.app.launchTunnel()
    }
}

class testSearchMovies: Feature {
    
    func testViewResults() {
        Given("Given I'm viewing the search results section")
        When("When I search for Star Wars")
        Then("Then I should see search results")
    }
}
