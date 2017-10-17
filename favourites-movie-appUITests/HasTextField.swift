//
//  HasTextField.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago (Tester) on 16/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago (Tester). All rights reserved.
//

import Foundation
import XCTest

protocol HasTextFields: class {
    var textFields: XCUIElementQuery {get set}
}

extension HasTextFields where Self:App {
    
    func enterText(text: String, elementIdentifier: String) -> Void {
        UIPasteboard.general.string = text
        self.textFields[elementIdentifier].doubleTap()
        app.menuItems["Paste"].tap()
    }
}
