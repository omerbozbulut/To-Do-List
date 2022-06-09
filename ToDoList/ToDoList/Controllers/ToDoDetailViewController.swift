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
    private let toDoLogic = ToDoLogic()
    private let dateFormatter = DateFormatter()
    var toDoIndex = 0
    
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
        makeDateLabelConstraints()
    }
    
    private func configureDesign() {
        titleLabelDesign()
        descriptionLabelDesign()
        dateLabelDesign()
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
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 20)
        
    }
    
    private func dateLabelDesign(){
        dateLabel.textColor = .red
        dateLabel.textAlignment = .right
        let date = toDoLogic.getToDo(toDoIndex).date
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        dateLabel.text = dateFormatter.string(from: date)
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
            make.height.equalTo(80)
        }
    }
    
    private func makeDateLabelConstraints(){
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-80)
            make.right.left.equalToSuperview().offset(-32)
            make.height.equalTo(40)
        }
    }
    
}
