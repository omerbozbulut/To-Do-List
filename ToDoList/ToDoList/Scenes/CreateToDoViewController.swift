//
//  CreateToDoViewController.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 7.06.2022.
//

import UIKit

class CreateToDoViewController: UIViewController {

    private let titleLabel = UILabel()
    private let titleTextField = UITextField()
    private let descriptionTextField = UITextField()
    private let datePicker = UIDatePicker()
    private let createButton = UIButton()
    private let cancelButton = UIButton()
    var toDoLogic = ToDoLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(titleLabel)
        view.addSubview(datePicker)
        view.addSubview(createButton)
        view.addSubview(cancelButton)
        
        configureDesign()
        configureConstraints()
    }

    private func configureDesign() {
        view.backgroundColor = .white
        
        titleLabelDesign()
        titleTextFieldDesign()
        descriptionTextFieldDesign()
        datePickerDesign()
        cancelButtonDesign()
        createButtonDesign()
    }
    
    private func configureConstraints(){
        makeTitleLabelConstraints()
        makeTitleTextFieldConstraints()
        makeDescriptionTextFieldConstraints()
        makeDatePickerConstraints()
        makeCancelButtonConstraints()
        makeCreateButtonConstraints()
    }
    
//MARK: - Design
    private func titleLabelDesign() {
        titleLabel.text = "Create To-Do"
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueBOLD, size: 25)
    }
    
    private func titleTextFieldDesign() {
        titleTextField.placeholder = "Title"
        titleTextField.backgroundColor = .lightGray
        titleTextField.textAlignment = .left
        titleTextField.layer.masksToBounds = true
        titleTextField.layer.cornerRadius = 10
        titleTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.descriptionTextField.frame.height))
        titleTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    private func descriptionTextFieldDesign() {
        descriptionTextField.placeholder = "Description"
        descriptionTextField.backgroundColor = .lightGray
        descriptionTextField.textAlignment = .left
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.layer.cornerRadius = 10
        descriptionTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.descriptionTextField.frame.height))
        descriptionTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    private func datePickerDesign() {
        
    }
    
    private func cancelButtonDesign() {
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .red
        cancelButton.titleLabel?.textColor = .white
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
    }
    
    private func createButtonDesign() {
        createButton.setTitle("Create", for: .normal)
        createButton.backgroundColor = .blue
        createButton.titleLabel?.textColor = .white
        createButton.layer.cornerRadius = 10
        createButton.layer.masksToBounds = true
    }
    
//MARK: - Constraints
    private func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.top.equalTo(80)
        }
    }
    
    private func makeTitleTextFieldConstraints() {
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(64)
            make.trailing.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(48)
        }
    }
    
    private func makeDescriptionTextFieldConstraints() {
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField).offset(72)
            make.trailing.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(64)
        }
    }
    
    private func makeDatePickerConstraints() {
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextField).offset(80)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeCancelButtonConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
    private func makeCreateButtonConstraints() {
        createButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.trailing.equalToSuperview().offset(-40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
}
