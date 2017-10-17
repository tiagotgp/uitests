//
//  App.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago (Tester) on 16/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago (Tester). All rights reserved.
//

import Foundation
import XCTest

protocol App {
    var app: XCUIApplication {get}
}

extension App {
    
    func tapBackButton() {
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
}
