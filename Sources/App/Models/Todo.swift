import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
final class Todo: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?

    /// A title describing what this `Todo` entails.
    var title: String
    var completed: Bool
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}

extension Todo: Migration, Content, Parameter { }

