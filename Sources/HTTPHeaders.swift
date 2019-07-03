//
//  HTTPHeaders.swift
//  GitHubActivityFeed
//
//  Created by Piotr Łyczba on 11/05/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

public enum ContentType: String {
    case json = "application/json"
}

public enum HTTPHeaderKey: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
