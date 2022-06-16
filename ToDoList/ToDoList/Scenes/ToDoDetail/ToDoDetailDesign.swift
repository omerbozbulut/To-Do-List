//
//  ToDoDetailDesign.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 16.06.2022.
//

import UIKit

extension ToDoDetailViewController {
    
//MARK: - Design
    func titleLabelDesign() {
        titleLabel.text = "Edit title"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 25)
    }
    
    func titleTextFieldDesign() {
        titleLTextField.text = viewModel.getToDo(toDoIndex).title
        titleLTextField.textColor = .white
        titleLTextField.tintColor = .white
        titleLTextField.textAlignment = .left
        titleLTextField.backgroundColor = .systemIndigo
        titleLTextField.layer.masksToBounds = true
        titleLTextField.layer.cornerRadius = 10
        titleLTextField.font = .systemFont(ofSize: 22)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.titleLTextField.frame.height))
        titleLTextField.leftView = paddingView
        titleLTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    func descriptionLabelDesign() {
        descriptionLabel.text = "Edit note"
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 25)
    }
    
    func descriptionTextFieldDesign() {
        descriptionTextField.text = viewModel.getToDo(toDoIndex).description
        descriptionTextField.textColor = .white
        descriptionTextField.tintColor = .white
        descriptionTextField.font = .systemFont(ofSize: 22)
        descriptionTextField.backgroundColor = .systemIndigo
        descriptionTextField.textAlignment = .left
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.layer.cornerRadius = 10
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.descriptionTextField.frame.height))
        descriptionTextField.leftView = paddingView
        descriptionTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    func dateLabelDesign() {
        dateLabel.textColor = .systemIndigo
        dateLabel.textAlignment = .right
        dateLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 19)
        let date = viewModel.getToDo(toDoIndex).date
        dateLabel.text = viewModel.dateToString(date: date)
    }
    
    func cancelButtonDesign() {
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .red
        cancelButton.titleLabel?.textColor = .white
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
    }
    
    func saveButtonDesign() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .blue
        saveButton.titleLabel?.textColor = .white
        saveButton.layer.cornerRadius = 10
        saveButton.layer.masksToBounds = true
    }
    
//MARK: - Constraints
    func makeTitleLabelConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    func makeTitleTextFieldConstraints() {
        titleLTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(64)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    func descriptionLabelConstrints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLTextField).offset(80)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    func makeDescriptionTextFieldConstraints() {
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel).offset(64)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    func makeDateLabelConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextField).offset(80)
            make.right.left.equalToSuperview().offset(-32)
            make.height.equalTo(48)
        }
    }
    
    func cancelButtonConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
    func saveButtonConstraints() {
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.trailing.equalToSuperview().offset(-40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
}
