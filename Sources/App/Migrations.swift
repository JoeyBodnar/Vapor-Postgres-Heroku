//
//  Migrations.swift
//  App
//
//  Created by Stephen Bodnar on 6/10/18.
//

import Foundation
import FluentPostgreSQL
import Vapor

struct AddCompletedToTodos: Migration {
    
    // Need to declare which database
    typealias Database = PostgreSQLDatabase
    
    static func prepare(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Database.update(Todo.self, on: connection, closure: { (updater) in
            try updater.field(type: PostgreSQLColumn(type: PostgreSQLDataType.bool), for: \Todo.completed, isOptional: false, isIdentifier: false)
        })
    }
    
    static func revert(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Future.map(on: connection) {}
    }
}

 struct RemoveCompletedFromTodos: Migration {
    typealias Database = PostgreSQLDatabase
    static func prepare(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Database.update(Todo.self, on: connection, closure: { updater in
            try updater.removeField(for: \Todo.completed)
        })
    }
    
    static func revert(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Future.map(on: connection) {}
    }
}
