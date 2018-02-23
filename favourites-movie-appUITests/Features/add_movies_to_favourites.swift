//
//  add_movies_to_favourites.swift
//  favourites-movie-appUITests
//
//  Created by Goncalves Pereira, Tiago on 23/10/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import XCTest
import XCTest_Gherkin
import SBTUITestTunnel

class addMoviesToFavourites: Feature {
    
    func testAddMovieToFavourites() {
        Given("I have searched for Star Wars")
        When("I add Star Wars: The Force Awakens to favourites")
        Then("I should see the movie in the favourites list")
    }
}
