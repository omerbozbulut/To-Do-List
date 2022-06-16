//
//  ToDoDetailViewController.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 7.06.2022.
//

import UIKit
import SnapKit

class ToDoDetailViewController: UIViewController {

    let titleLabel = UILabel()
    let titleLTextField = UITextField()
    let descriptionTextField = UITextField()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    let cancelButton = UIButton()
    let saveButton = UIButton()
    
    var viewModel = ToDoLogicViewModel()
    var toDoIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionTextField.text = viewModel.getToDo(toDoIndex).description
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
            viewModel.updateToDo(title, description, toDoIndex)
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
}
