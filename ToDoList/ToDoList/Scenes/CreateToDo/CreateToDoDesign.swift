//
//  CreateToDoDesign.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 16.06.2022.
//

import UIKit

extension CreateToDoViewController {
    
//MARK: - Design
    func titleLabelDesign() {
        titleLabel.text = Constants.Titles.createToDoSceneLabel
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueBOLD, size: 25)
    }
    
    func titleTextFieldDesign() {
        titleTextField.textColor = .white
        titleTextField.tintColor = .white
        titleTextField.attributedPlaceholder = NSAttributedString(string: "Title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        titleTextField.backgroundColor = .systemIndigo
        titleTextField.textAlignment = .left
        titleTextField.layer.masksToBounds = true
        titleTextField.layer.cornerRadius = 10
        titleTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.descriptionTextField.frame.height))
        titleTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    func descriptionTextFieldDesign() {
        descriptionTextField.textColor = .white
        descriptionTextField.tintColor = .white
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        descriptionTextField.backgroundColor = .systemIndigo
        descriptionTextField.textAlignment = .left
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.layer.cornerRadius = 10
        descriptionTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.descriptionTextField.frame.height))
        descriptionTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    func cancelButtonDesign() {
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .red
        cancelButton.titleLabel?.textColor = .white
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
    }
    
    func createButtonDesign() {
        createButton.setTitle("Create", for: .normal)
        createButton.backgroundColor = .blue
        createButton.titleLabel?.textColor = .white
        createButton.layer.cornerRadius = 10
        createButton.layer.masksToBounds = true
    }
    
//MARK: - Constraints
    func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(80)
        }
    }
    
    func makeTitleTextFieldConstraints() {
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(64)
            make.trailing.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(48)
        }
    }
    
    func makeDescriptionTextFieldConstraints() {
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField).offset(72)
            make.trailing.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(64)
        }
    }
    
    func makeDatePickerConstraints() {
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextField).offset(80)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    func makeCancelButtonConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
    func makeCreateButtonConstraints() {
        createButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.trailing.equalToSuperview().offset(-40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
}
