//
//  ToDoDetailViewController.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 7.06.2022.
//

import UIKit
import SnapKit

class ToDoDetailViewController: UIViewController {

    private let titleLabel = UILabel()
    private let titleLTextField = UITextField()
    private let descriptionTextField = UITextField()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()
    private var toDoLogic = ToDoLogicViewModel()
    private let dateFormatter = DateFormatter()
    private let cancelButton = UIButton()
    private let saveButton = UIButton()
    var toDoIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionTextField.text = toDoLogic.getToDo(toDoIndex).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(titleLabel)
        view.addSubview(titleLTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(dateLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
        
        configureDesign()
        configureConstraints()
        configureAction()
    }
    
    @objc func turnBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveChanges() {
        if let description = descriptionTextField.text, let title = titleLTextField.text{
            toDoLogic.updateToDo(title, description, toDoIndex)
        }
        dismiss(animated: true)
    }
    
    private func configureAction() {
        cancelButton.addTarget(self, action: #selector(turnBack), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
    }
    
    private func configureConstraints() {
        makeTitleLabelConstraints()
        makeTitleTextFieldConstraints()
        makeDescriptionTextFieldConstraints()
        makeDateLabelConstraints()
        cancelButtonConstraints()
        saveButtonConstraints()
        descriptionLabelConstrints()
    }
    
    private func configureDesign() {
        view.backgroundColor = .white
        
        titleLabelDesign()
        titleTextFieldDesign()
        descriptionLabelDesign()
        descriptionTextFieldDesign()
        dateLabelDesign()
        cancelButtonDesign()
        saveButtonDesign()
    }
    
//MARK: - Design
    private func titleLabelDesign() {
        titleLabel.text = "Edit title"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 25)
    }
    
    private func titleTextFieldDesign() {
        titleLTextField.text = toDoLogic.getToDo(toDoIndex).title
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
    
    private func descriptionLabelDesign() {
        descriptionLabel.text = "Edit note"
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 25)
    }
    
    private func descriptionTextFieldDesign() {
        descriptionTextField.text = toDoLogic.getToDo(toDoIndex).description
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
    
    private func dateLabelDesign() {
        dateLabel.textColor = .systemIndigo
        dateLabel.textAlignment = .right
        dateLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 19)
        let date = toDoLogic.getToDo(toDoIndex).date
        dateLabel.text = toDoLogic.dateToString(date: date)
    }
    
    private func cancelButtonDesign() {
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .red
        cancelButton.titleLabel?.textColor = .white
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
    }
    
    private func saveButtonDesign() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .blue
        saveButton.titleLabel?.textColor = .white
        saveButton.layer.cornerRadius = 10
        saveButton.layer.masksToBounds = true
    }
    
//MARK: - Constraints
    private func makeTitleLabelConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    private func makeTitleTextFieldConstraints() {
        titleLTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(64)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    private func descriptionLabelConstrints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLTextField).offset(80)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    private func makeDescriptionTextFieldConstraints() {
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel).offset(64)
            make.trailing.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(72)
        }
    }
    
    private func makeDateLabelConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextField).offset(80)
            make.right.left.equalToSuperview().offset(-32)
            make.height.equalTo(48)
        }
    }
    
    private func cancelButtonConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
    private func saveButtonConstraints() {
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-48)
            make.trailing.equalToSuperview().offset(-40)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
}
