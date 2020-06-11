//
//  RestAPI.swift
//  GitHubActivityFeed
//
//  Created by Piotr Łyczba on 11/05/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import Alamofire

public protocol RestAPI {
    static var base: APIConfiguration { get }
}

public struct APIConfiguration {

    public let url: URL
    public let parameters: Parameters
    public let headers: HTTPHeaders

    public init(url: URL, parameters: Parameters = [:], headers: HTTPHeaders = [:]) {
        self.url = url
        self.parameters = parameters
        self.headers = headers
    }
    
}
