//
//  Feature.swift
//  favourites-movie-appUITests
//
//  Created by Goncalves Pereira, Tiago on 18/10/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation
import XCTest
import SBTUITestTunnel

class Feature: XCTestCase {
    
    override func setUp() {
        
        Home_Page.app = super.app
        SearchResults_Page.app = super.app
        
        super.app.launchTunnel()
    }
}
