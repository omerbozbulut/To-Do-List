//
//  logic.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 4.06.2022.
//

import Foundation

struct ToDoLogic{
    let toDoList: [ToDo] = [ToDo(title: "Markete git", description: "adasdas", completed: true),
                            ToDo(title: "Çamaşırları yıka", description: "adasdas22", completed: false)]
    
     func getToDos()->[ToDo]?{
        updateUserDefaults()
        if let data = UserDefaults.standard.value(forKey:"toDoList") as? Data {
            if let toDos = try? PropertyListDecoder().decode(Array<ToDo>.self, from: data){
                let inComplete = toDos.filter{ todo in
                    return todo.completed
                }
                return inComplete
            }
        }
         return nil
    }
    
     func createToDos(){
         
       updateUserDefaults()
    }
    
    func updateUserDefaults(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoList), forKey:"toDoList")
    }
    
    
}
