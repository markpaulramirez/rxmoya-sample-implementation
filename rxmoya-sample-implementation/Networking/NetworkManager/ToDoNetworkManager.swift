//
//  ToDoNetworkManager.swift
//  rxmoya-sample-implementation
//
//  Created by Mark Paul Ramirez on 5/31/22.
//

import Foundation
import RxSwift
import Moya
import RxMoya

struct ToDoNetworkManager {
    
    static let shared = ToDoNetworkManager()
    
    private let provider = MoyaProvider<ToDoService>(plugins: [NetworkLoggerPlugin()])
    
    private init() {}
    
    func fetchAllToDo() -> Single<[ToDoOutputModel]> {
        return provider.rx
            .request(.fetchAllToDo)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([ToDoOutputModel].self)
    }
}
