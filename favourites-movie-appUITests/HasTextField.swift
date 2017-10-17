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
    static var textFields: XCUIElementQuery? {get}
}

extension HasTextFields where Self:App {
    
    static func enterText(text: String, elementIdentifier: String) -> Void {
        UIPasteboard.general.string = text
        self.textFields?[elementIdentifier].doubleTap()
        self.app?.menuItems["Paste"].tap()
    }
}
