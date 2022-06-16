//
//  ToDoListDesign.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 16.06.2022.
//

import UIKit
import SnapKit

extension ToDoListViewController {
    //MARK: - Design
        func buttonDesign() {
            createToDoButton.backgroundColor = .systemIndigo
            //alignment
            createToDoButton.contentHorizontalAlignment = .left
            createToDoButton.contentVerticalAlignment = .center
            //title
            createToDoButton.setTitleColor(.white, for: .normal)
            createToDoButton.titleLabel?.font = UIFont(name: Constants.Fonts.HelveticaNeueMEDİUM, size: 20)
            createToDoButton.setTitle("New To-Do", for: .normal)
            //image
            createToDoButton.setImage(UIImage(systemName: Constants.createButtonImageName), for: .normal)
            createToDoButton.setInsets(forContentPadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), imageTitlePadding: 15)
            createToDoButton.imageView?.tintColor = .white
        }
        
        func tableViewDesign() {
            toDoListTable.rowHeight = 104
            toDoListTable.register(ToDoTableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
            toDoListTable.separatorColor = .black
        }
        
        func titleLabelDesign() {
            titleLabel.text = Constants.Titles.toDoListSceneTitle
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont(name: Constants.Fonts.HelveticaNeueBOLD, size: 25)
            titleLabel.textColor = .white
        }
        
    //MARK: - Constraints
        func makeTitleLabelConstraints() {
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(40)
                make.centerX.equalTo(view.center.x)
                make.height.equalTo(40)
            }
        }
            
        func makeToDoListTableConstraints() {
            toDoListTable.snp.makeConstraints { make in
                make.top.equalTo(titleLabel).offset(48)
                make.right.left.equalToSuperview()
                make.bottom.equalTo(createToDoButton)
            }
        }
            
        func makeCreateToDoButtonConstraints() {
            createToDoButton.snp.makeConstraints { make in
                make.height.equalTo(48)
                make.width.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
        }
    }

//MARK: ~UIButton
extension UIButton {
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
}
