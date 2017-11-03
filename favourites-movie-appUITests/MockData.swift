//
//  MockRequests.swift
//  favourites-movie-appUITests
//
//  Created by Goncalves Pereira, Tiago on 16/10/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation
import SBTUITestTunnel

struct MockData {

    static func mockResponse(app: SBTUITunneledApplication, requestURL: String, responseFile: String) -> Void {
        let request = SBTRequestMatch.init(url: requestURL)
        let response = SBTStubResponse.init(fileNamed: responseFile)
        
        app.stubRequests(matching: request, response: response)
    }
}
