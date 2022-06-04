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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
        configure()
    }

    private func configure(){
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(toDoListTable)
        view.addSubview(createToDoButton)
        
        configureDesign()
        makeTitleLabelConstrainsts()
        makeCreateToDoButtonConstrainsts()
        makeToDoListTableConstrainsts()
    }
    
//MARK: - Constrainsts
    private func makeTitleLabelConstrainsts(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(40)
        }
    }
    
    private func makeToDoListTableConstrainsts(){
        toDoListTable.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(48)
            make.right.left.equalToSuperview()
            make.bottom.equalTo(createToDoButton)
        }
    }
    
    private func makeCreateToDoButtonConstrainsts(){
        createToDoButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureDesign(){
        view.backgroundColor = .lightGray

        buttonDesign()
        tableViewDesign()
        titleLabelDesign()
    }
    
//MARK: - Design
    private func buttonDesign(){
        createToDoButton.backgroundColor = .lightGray
        //alignment
        createToDoButton.contentHorizontalAlignment = .left
        createToDoButton.contentVerticalAlignment = .center
        //title
        createToDoButton.setTitleColor(.systemIndigo, for: .normal)
        createToDoButton.titleLabel?.font = UIFont(name: "HelveticaNeue-medium", size: 20)
        createToDoButton.setTitle("New to do", for: .normal)
        //image
        createToDoButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        createToDoButton.setInsets(forContentPadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), imageTitlePadding: 15)
        
    }
    
    private func tableViewDesign(){
        toDoListTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func titleLabelDesign(){
        titleLabel.text = "To Do List"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        titleLabel.textColor = .systemIndigo
    }

}

//MARK: ~EXTENSİONS
extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
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