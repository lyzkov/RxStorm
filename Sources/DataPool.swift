//
//  DataPool.swift
//  GitHubActivityFeed
//
//  Created by Piotr Łyczba on 12/05/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import RxSwift
import Alamofire

public protocol DataPool {
    associatedtype DataRequest: URLRequestConvertible

    func decodedData<D: Decodable>(from request: DataRequest) -> Single<D>
}

extension DataPool {

    public func decodedData<D: Decodable>(from request: DataRequest) -> Single<D> {
        return SessionManager.default.rx.decodedData(from: request)
    }

}
