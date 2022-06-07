//
//  logic.swift
//  ToDoList
//
//  Created by omer faruk bozbulut on 4.06.2022.
//

import Foundation

struct ToDoLogic{
    let toDoList: [ToDo] = [ToDo(title: "Markete git", description: "ekmek, su, kahve, çikolata ekmek, su, kahve ekmek, su, kahve ekmek, su, kahve ekmek, su, kahve ekmek, su, kahve ekmek, su, kahveal", date: Date(timeIntervalSince1970: 432233446145.0/1000.0), completed: false),
                            ToDo(title: "Çamaşırları yıka", description: "adasdas22", date: Date(timeIntervalSince1970: 4333446145.0/1000.0), completed: false)]
    
     func getToDos()->[ToDo]?{
        updateUserDefaults()
        if let data = UserDefaults.standard.value(forKey:"toDoList") as? Data {
            if let toDos = try? PropertyListDecoder().decode(Array<ToDo>.self, from: data){
                let inComplete = toDos.filter{ todo in
                    return !todo.completed
                }
                return inComplete
            }
        }
         return nil
    }
    
    func getToDo(_ index:Int)->ToDo{
        updateUserDefaults()
        guard let toDos = getToDos() else {return ToDo(title: "Error", description: "To do not found", date: Date(timeIntervalSince1970: 432233446145.0/1000.0), completed: false)}
        return toDos[index]
    }
    
     func createToDos(){
         
       updateUserDefaults()
    }
    
    func updateUserDefaults(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoList), forKey:"toDoList")
    }
    
    
}
