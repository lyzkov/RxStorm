//
//  Endpoint.swift
//  GitHubActivityFeed
//
//  Created by Piotr Łyczba on 11/05/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Alamofire

public protocol Endpoint: URLRequestConvertible {
    static var api: RestAPI.Type { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }
}

public protocol Resource {
    associatedtype Result: Decodable
}

extension Endpoint {

    public var headers: HTTPHeaders {
        return [:]
    }

    public var parameters: Parameters {
        return [:]
    }

}

extension Endpoint {

    public func asURLRequest() throws -> URLRequest {
        let base = Self.api.base

        return request(
            base.url + path,
            method: method,
            parameters: base.parameters + parameters,
            encoding: encoding,
            headers: base.headers + headers
            ).request!
    }

}

public protocol GetEndpoint: Endpoint {
}

extension GetEndpoint {

    public var method: HTTPMethod {
        return .get
    }

    public var encoding: ParameterEncoding {
        return URLEncoding.default
    }

}
