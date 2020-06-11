//
//  SessionManager.swift
//  GitHubActivityFeed
//
//  Created by Piotr Łyczba on 11/05/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

extension SessionManager {

    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()

}

extension Reactive where Base: SessionManager {

    public func data<E: Endpoint>(from endpoint: E) -> Single<Data> {
        let base = E.api.base
        
        return RxAlamofire.data(
            endpoint.method,
            base.url + endpoint.path,
            parameters: base.parameters + endpoint.parameters,
            encoding: endpoint.encoding,
            headers: base.headers + endpoint.headers
        ).asSingle()
    }

    public func decodedData<E: Endpoint & Resource>(from endpoint: E) -> Single<E.Result> {
        return data(from: endpoint).decode(with: Base.decoder).asSingle()
    }

    public func response<E: Endpoint>(from endpoint: E) -> Completable {
        return data(from: endpoint).asCompletable()
    }

    public func data(from request: URLRequestConvertible) -> Single<Data> {
        return self.request(urlRequest: request).data().asSingle()
    }

    public func decodedData<Model: Decodable>(from request: URLRequestConvertible) -> Single<Model> {
        return data(from: request).decode(with: Base.decoder).asSingle()
    }

}
