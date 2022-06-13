//
//  ViewController.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 1.06.2022.
//

import UIKit
import SnapKit

class ToDoListViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let toDoListTable = UITableView()
    private let createToDoButton = UIButton()
    private var toDoLogic = ToDoLogic()
    private var selectedRow = 0
        
    override func viewWillAppear(_ animated: Bool) {
        updateData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
        toDoLogic.delegate = self
        configure()
    }

    private func configure() {
        view.addSubview(titleLabel)
        view.addSubview(toDoListTable)
        view.addSubview(createToDoButton)
        
        configureDesign()
        makeTitleLabelConstraints()
        makeCreateToDoButtonConstraints()
        makeToDoListTableConstraints()
        
        createToDoButton.addTarget(self, action: #selector(createToDo), for: .touchUpInside)
    }
    
    @objc func createToDo(){
        let createToDo = CreateToDoViewController()
        createToDo.modalPresentationStyle = .fullScreen
        present(createToDo, animated: true, completion: nil)
    }
    
    func updateData(){
        DispatchQueue.main.async {
            self.toDoListTable.reloadData()
        }
    }
    
//MARK: - Constraints
    private func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(40)
        }
    }
    
    private func makeToDoListTableConstraints() {
        toDoListTable.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(48)
            make.right.left.equalToSuperview()
            make.bottom.equalTo(createToDoButton)
        }
    }
    
    private func makeCreateToDoButtonConstraints() {
        createToDoButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureDesign() {
        view.backgroundColor = .systemIndigo

        buttonDesign()
        tableViewDesign()
        titleLabelDesign()
    }
    
//MARK: - Design
    private func buttonDesign() {
        createToDoButton.backgroundColor = .systemIndigo
        //alignment
        createToDoButton.contentHorizontalAlignment = .left
        createToDoButton.contentVerticalAlignment = .center
        //title
        createToDoButton.setTitleColor(.white, for: .normal)
        createToDoButton.titleLabel?.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 20)
        createToDoButton.setTitle("New To-Do", for: .normal)
        //image
        createToDoButton.setImage(UIImage(systemName: Constants.createButtonImageName), for: .normal)
        createToDoButton.setInsets(forContentPadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), imageTitlePadding: 15)
        createToDoButton.imageView?.tintColor = .white
    }
    
    private func tableViewDesign() {
        toDoListTable.rowHeight = 104
        toDoListTable.register(ToDoTableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        toDoListTable.separatorColor = .black
    }
    
    private func titleLabelDesign() {
        titleLabel.text = "To-Do List"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueBOLD, size: 25)
        titleLabel.textColor = .white
    }
}

//MARK: ~EXTENSİONS
extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = toDoLogic.getToDos()?.count {return count}
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        let toDoDetail = ToDoDetailViewController()
        toDoDetail.modalPresentationStyle = .fullScreen
        toDoDetail.toDoIndex = indexPath.row
        present(toDoDetail, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath) as! ToDoTableViewCell
        let toDo = toDoLogic.getToDo(indexPath.row)
        cell.configureToDo(toDo: toDo)
        cell.selectionStyle = .none
        cell.index = indexPath.row
        return cell
    }
}

extension ToDoListViewController: ReloadDelegate {
    func refresh() {
        updateData()
    }
}

extension UIButton {
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
}
