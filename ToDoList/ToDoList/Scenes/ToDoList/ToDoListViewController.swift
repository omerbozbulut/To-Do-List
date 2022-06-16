//
//  ViewController.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 1.06.2022.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    let titleLabel = UILabel()
    let toDoListTable = UITableView()
    let createToDoButton = UIButton()
    
    let viewModel = ToDoLogicViewModel()
    var selectedRow = 0
        
    override func viewWillAppear(_ animated: Bool) {
        updateData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
    
        configure()
    }

    private func configure() {
        view.addSubview(titleLabel)
        view.addSubview(toDoListTable)
        view.addSubview(createToDoButton)
        
        configureDesign()
        configureConstraints()
        configureAction()
        
    }
    
    @objc func createToDo(){
        let createToDo = CreateToDoViewController()
        createToDo.modalPresentationStyle = .fullScreen
        present(createToDo, animated: true, completion: nil)
    }
    
    func updateData(){
        toDoListTable.reloadData()
    }
    
    private func configureConstraints() {
        makeTitleLabelConstraints()
        makeCreateToDoButtonConstraints()
        makeToDoListTableConstraints()
    }
    
    private func configureDesign() {
        view.backgroundColor = .systemIndigo

        buttonDesign()
        tableViewDesign()
        titleLabelDesign()
    }
    
    private func configureAction() {
        createToDoButton.addTarget(self, action: #selector(createToDo), for: .touchUpInside)
    }
}
