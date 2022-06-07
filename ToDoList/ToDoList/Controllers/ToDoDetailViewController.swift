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
    private let descriptionLabel = UILabel()
    private let dateLabel = UILabel()

    var toDoIndex = 0
    private let toDoLogic = ToDoLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(dateLabel)
        
        configureDesign()
        makeTitleLabelConstraints()
        makeDescriptionLabelConstraints()
    }
    
    private func configureDesign() {
        titleLabelDesign()
        descriptionLabelDesign()
    }
    
    //MARK: - Design
    private func titleLabelDesign(){
        titleLabel.text = toDoLogic.getToDo(toDoIndex).title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueBOLD, size: 30)
        
    }
    
    private func descriptionLabelDesign(){
        descriptionLabel.text = toDoLogic.getToDo(toDoIndex).description
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 20)
        
    }
    
    private func dateLabelDesign(){
        //dateLabel.text = toDoLogic.getToDo(toDoIndex).date
    }
    
    //MARK: - Constraints
    private func makeTitleLabelConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.right.left.equalToSuperview().offset(32)
            make.top.equalTo(64)
        }
    }
    
    private func makeDescriptionLabelConstraints(){
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(80)
            make.right.left.equalToSuperview().offset(32)
        }
    }
    
}
