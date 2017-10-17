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
    var tableView: XCUIElement {get set}
}

extension HasTableView {
    
    func getMovieDetailsElement(index: UInt, elementIdentifier: String) -> String {
        return self.tableView.cells.element(boundBy: index).staticTexts[elementIdentifier].label.description
    }
    
    func getNumberOfCells() -> Int {
        
        return Int(bitPattern: (self.tableView.cells.count))
    }
    
    func getMovieCellIndexByDetails(title: String, year: String) -> UInt? {
        
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
