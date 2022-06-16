//
//  CreateToDoViewController.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 7.06.2022.
//

import UIKit

class CreateToDoViewController: UIViewController {

    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let descriptionTextField = UITextField()
    let datePicker = UIDatePicker()
    let createButton = UIButton()
    let cancelButton = UIButton()
    var toDoLogic = ToDoLogicViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(titleLabel)
        view.addSubview(datePicker)
        view.addSubview(createButton)
        view.addSubview(cancelButton)
        
        configureDesign()
        configureConstraints()
        configureAction()
    }
    
    @objc func createToDo() {
        guard let title = titleTextField.text else {return}
        guard let description = descriptionTextField.text else {return}
        let date = datePicker.date
        
        if !title.isEmpty && !description.isEmpty{
            toDoLogic.createToDo(title: title, description: description, date: date)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func turnBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureAction() {
        createButton.addTarget(self, action: #selector(createToDo), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(turnBack), for: .touchUpInside)
    }

    func configureDesign() {
        view.backgroundColor = .white
        
        titleLabelDesign()
        titleTextFieldDesign()
        descriptionTextFieldDesign()
        cancelButtonDesign()
        createButtonDesign()
    }
    
    func configureConstraints(){
        makeTitleLabelConstraints()
        makeTitleTextFieldConstraints()
        makeDescriptionTextFieldConstraints()
        makeDatePickerConstraints()
        makeCancelButtonConstraints()
        makeCreateButtonConstraints()
    }
}
