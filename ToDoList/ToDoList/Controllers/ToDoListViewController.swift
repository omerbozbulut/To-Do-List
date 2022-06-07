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
    private let toDoLogic = ToDoLogic()
    private var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
        configure()
    }

    private func configure() {
        view.translatesAutoresizingMaskIntoConstraints = false
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
        //present(ToDoListViewController(), animated: true, completion: nil)
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
        view.backgroundColor = .lightGray

        buttonDesign()
        tableViewDesign()
        titleLabelDesign()
    }
    
//MARK: - Design
    private func buttonDesign() {
        createToDoButton.backgroundColor = .lightGray
        //alignment
        createToDoButton.contentHorizontalAlignment = .left
        createToDoButton.contentVerticalAlignment = .center
        //title
        createToDoButton.setTitleColor(.systemIndigo, for: .normal)
        createToDoButton.titleLabel?.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 20)
        createToDoButton.setTitle("New to do", for: .normal)
        //image
        createToDoButton.setImage(UIImage(systemName: Constants.buttonImageName), for: .normal)
        createToDoButton.setInsets(forContentPadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), imageTitlePadding: 15)
        createToDoButton.imageView?.tintColor = .systemIndigo
    }
    
    private func tableViewDesign() {
        toDoListTable.backgroundColor = UIColor(red: 223/255, green: 223/255, blue: 222/255, alpha: 1.0)
        toDoListTable.rowHeight = 80
        toDoListTable.register(UITableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
    }
    
    private func titleLabelDesign() {
        titleLabel.text = "To Do List"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueBOLD, size: 25)
        titleLabel.textColor = .systemIndigo
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
        performSegue(withIdentifier: Constants.showToDoDetailIdentifier, sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath)
        guard let toDos = toDoLogic.getToDos() else {return UITableViewCell()}
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.title
        cell.selectionStyle = .none
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.showToDoDetailIdentifier{
            let destination = segue.destination as! ToDoDetailViewController
            destination.toDoIndex = selectedRow
        }
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
