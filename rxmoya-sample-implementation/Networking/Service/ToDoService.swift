//
//  ToDoService.swift
//  rxmoya-sample-implementation
//
//  Created by Mark Paul Ramirez on 5/31/22.
//

import Foundation
import Moya

enum ToDoService {
    case createToDo
    case fetchToDo(id: Int)
    case fetchAllToDo
    case modifyToDo(id: Int)
    case removeToDo(id: Int)
}

extension ToDoService: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .createToDo:
            return "/todos"
        case .fetchToDo(let id):
            return "/todos/\(id)"
        case .fetchAllToDo:
            return "/todos"
        case .modifyToDo(let id):
            return "/todos/\(id)"
        case .removeToDo(let id):
            return "/todos/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createToDo:
            return .post
        case .fetchToDo:
            return .get
        case .fetchAllToDo:
            return .get
        case .modifyToDo:
            return .put
        case .removeToDo:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .createToDo,
             .fetchToDo,
             .fetchAllToDo,
             .modifyToDo,
             .removeToDo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
