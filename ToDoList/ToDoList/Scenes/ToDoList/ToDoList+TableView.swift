//
//  ToDoList+TableView.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 16.06.2022.
//

import UIKit

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.getToDos()?.count {return count}
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
        let toDo = viewModel.getToDo(indexPath.row)
        cell.configureToDo(toDo: toDo)
        cell.selectionStyle = .none
        cell.index = indexPath.row
        cell.reloadDelegate = self
        return cell
    }
}

extension ToDoListViewController: ReloadDelegate {
    func refresh() {
        updateData()
    }
}

