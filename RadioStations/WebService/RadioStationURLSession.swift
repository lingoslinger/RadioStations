//
//  RadioStationURLSession.swift
//  RadioStations
//
//  Created by Allan Evans on 11/17/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//

import Foundation

typealias SessionCompletionHandler = (_ data : Data?, _ response : URLResponse?, _ error : Error?) -> Void

class RadioStationURLSession: URLSession {
    func sendRequest(_ completionHandler: @escaping SessionCompletionHandler) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let urlString = Bundle.main.decodeWebservicePlist(from: "Webservice", fileExtension: "plist")
        guard let URL = URL(string:urlString) else {
            fatalError("Web service URL not valid")
        }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
