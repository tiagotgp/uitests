//
//  HasTable.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago (Tester) on 16/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago (Tester). All rights reserved.
//

import Foundation
import XCTest

protocol HasTableView: class {
    static var tableView: XCUIElement? {get}
}

extension HasTableView {
    
    static func getMovieDetailsElement(index: UInt, elementIdentifier: String) -> String? {
        return self.tableView?.cells.element(boundBy: index).staticTexts[elementIdentifier].label.description
    }
    
    static func getNumberOfCells() -> Int {
        
        guard let tableView = self.tableView else { return 0 }
        return Int(bitPattern: (tableView.cells.count))
    }
    
    static func getMovieCellIndexByDetails(title: String, year: String) -> UInt? {
        
        for movie in (0..<self.getNumberOfCells()) {
            let number:UInt = UInt(movie)
            if (getMovieDetailsElement(index: number, elementIdentifier: "movieTitle")) == title && getMovieDetailsElement(index: number, elementIdentifier: year) == year {
                return number
            }
        }
        
        XCTFail("Cannot find movie")
        return nil
    }

    
}
