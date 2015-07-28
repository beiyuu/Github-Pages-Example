//
//  User.swift
//  Scratch
//
//  Created by apple on 15/4/23.
//  Copyright (c) 2015年 iCumpus. All rights reserved.
//

import Foundation

struct User{
    let name: String
    let company: String
    let login: String
    let password: String
    
    static func login(login: String, password: String) ->User? {
        if let user = database[login] {
            if user.password == password{
                return  user
            }
        }
        return nil
    }
    
    static let database: Dictionary<String, User> = {
        var theDataBase = Dictionary<String, User>()
        for user in [
            User(name: "John Appleseed", company: "Apple", login: "japple", password: "foo"),
            User(name: "Madison", company: "World Champion", login: "madbum", password: "foo"),
            User(name: "Jhon Hennessy", company: "Stanford", login: "hennessy", password: "foo"),
            User(name: "Bad Guy", company: "Criminals", login: "baddie", password: "foo")]{
                theDataBase[user.login] = user
        }
        return theDataBase
    }()
}
