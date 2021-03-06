//
//  logic.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 4.06.2022.
//

import Foundation

var toDoList: [ToDo] = [
    ToDo(title: "Mentörlük toplantısı", description: "Code review", date: Date(timeIntervalSince1970: 1660000000000.0/1000.0), completed: false)]

struct ToDoLogicViewModel {
    
    func dateToString(date: Date)->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormatString
        let stringDate = dateFormatter.string(from: date)
        return stringDate
    }
    
     func getToDos() ->[ToDo]? {
        updateUserDefaults()
         if let data = UserDefaults.standard.value(forKey: Constants.userDefaultsKey) as? Data {
            if let toDos = try? PropertyListDecoder().decode(Array<ToDo>.self, from: data){
                let inComplete = toDos.filter{ todo in
                    return !todo.completed
                }
                return inComplete
            }
        }
         return nil
    }
    
    func getToDo(_ index: Int)->ToDo {
        updateUserDefaults()
        guard let toDos = getToDos() else {return ToDo(title: "Error", description: "To do not found", date: Date.init(timeIntervalSinceNow: 1), completed: false)}
        return toDos[index]
    }
    
    func completeToDo(_ toDoIndex: Int) {
        toDoList.remove(at: toDoIndex)
        updateUserDefaults()
    }
    
    func createToDo(title: String, description: String, date: Date) {
        let newToDo = ToDo(title: title, description: description, date: date, completed: false)
        toDoList.append(newToDo)
        updateUserDefaults()
    }
    
    mutating func updateToDo(_ title: String, _ description: String, _ toDoIndex: Int) {
        let oldToDo = toDoList[toDoIndex]
        let newToDo = ToDo(title: title, description: description, date: oldToDo.date, completed: oldToDo.completed)
        toDoList.remove(at: toDoIndex)
        toDoList.append(newToDo)
        updateUserDefaults()
    }
    
    func updateUserDefaults() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoList), forKey: Constants.userDefaultsKey)
    }
}
