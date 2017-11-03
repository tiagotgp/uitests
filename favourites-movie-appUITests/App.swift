//
//  App.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 16/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation
import XCTest

protocol App {
    static var app: XCUIApplication? {get}
}

extension App {
    
    static func tapBackButton() {
        app?.navigationBars.buttons.element(boundBy: 0).tap()
    }
}
