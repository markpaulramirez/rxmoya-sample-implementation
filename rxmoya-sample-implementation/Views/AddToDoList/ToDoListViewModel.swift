//
//  AddToDoListViewModel.swift
//  rxmoya-sample-implementation
//
//  Created by Mark Paul Ramirez on 5/31/22.
//

import Foundation
import Moya
import RxSwift
import RxMoya

class ToDoListViewModel {
    
    func fetchAllToDo() -> Completable {
        return .create { observer in
            ToDoNetworkManager.shared.fetchAllToDo().subscribe { model in
                dump(model)
                observer(.completed)
            } onFailure: { error in
                observer(.error(error))
            } onDisposed: {
                observer(.completed)
            }
        }
    }
}
