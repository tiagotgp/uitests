//
//  HasTable.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 16/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation
import XCTest

protocol HasTableView: class {
    static var tableView: XCUIElement? {get}
}

extension HasTableView {
    
    static func getNumberOfCells() -> Int {
        
        guard let tableView = self.tableView else { return 0 }
        return Int(bitPattern: (tableView.cells.count))
    }

}
