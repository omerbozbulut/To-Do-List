//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 6.06.2022.
//

import Foundation
import UIKit
import SnapKit

class ToDoTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let completeButton = UIButton()
    private let dateLabel = UILabel()
    private let toDoLogic = ToDoLogic()
    var index = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(completeButton)
        addSubview(titleLabel)
        addSubview(dateLabel)
        
        configureConstraints()
        configureDesign()
        completeButton.addTarget(self, action: #selector(toDoCompleted), for: .touchUpInside)
    }
    
    @objc func toDoCompleted() {
        toDoLogic.completeToDo(index)
    }
    
    func configureToDo(toDo: ToDo) {
        titleLabel.text = toDo.title
        dateLabel.text = toDoLogic.dateToString(date: toDo.date)
    }
    
//MARK: - Design
    private func configureDesign() {
        titleLabelDesign()
        completeButtonDesign()
        dateLabelDesign()
    }
    
    private func titleLabelDesign() {
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 20)
    }
    
    private func completeButtonDesign() {
        completeButton.setImage(UIImage(systemName: Constants.completeButtonImageName), for: .normal)
        completeButton.setTitle("", for: .normal)
        completeButton.tintColor = .black
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func dateLabelDesign() {
        dateLabel.numberOfLines = 0
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textColor = .lightGray
    }
    
//MARK: - Constraints
    private func configureConstraints() {
        makecompleteButtonConstraints()
        makeTitleLabelConstraints()
        makeDateLabelConstraints()
    }
    
    private func makecompleteButtonConstraints() {
        completeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(8)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(64)
        }
    }
    
    private func makeTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(completeButton).offset(64)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalTo(dateLabel).offset(-16)
        }
    }
    
    private func makeDateLabelConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
