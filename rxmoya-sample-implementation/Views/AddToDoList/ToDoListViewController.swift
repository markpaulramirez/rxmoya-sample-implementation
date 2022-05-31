//
//  ViewController.swift
//  rxmoya-sample-implementation
//
//  Created by Mark Paul Ramirez on 5/30/22.
//

import UIKit
import RxMoya
import RxSwift
import Moya

class ToDoListViewController: UIViewController {

    let viewModel = ToDoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchAllToDo().subscribe()
    }
}

