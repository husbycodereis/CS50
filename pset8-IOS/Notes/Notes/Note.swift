import Foundation
import SQLite3

struct Note {
    var id: Int32
    var content: String
}

class NoteManager {
    var database: OpaquePointer?
    //creating a singleton --> is a software design pattern that restricts the instantiation of a class to one "single" instance. This is useful when exactly one object is needed to coordinate actions across the system.
    static let shared = NoteManager()
    
    private init() {
    }
    
    //key to prepare a statement --> take a statement --> prepare statement --> execute statement -->if it's select query, grab & get the values --> finalize
    
    //create a function inside NoteManager class to store the Note data inside userdirectory
    func connect() {
        if database != nil {
            return
        }
        
        let databaseURL = try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        ).appendingPathComponent("notes.sqlite")
        //open sqlite3 with given path on given database
        if sqlite3_open(databaseURL.path, &database) != SQLITE_OK {
            print("Error opening database")
            return
        }
        //create a sqlite file
        if sqlite3_exec(
            database,
            """
            CREATE TABLE IF NOT EXISTS notes (
                content TEXT
            )
            """,
            nil,
            nil,
            nil
        ) != SQLITE_OK {
            print("Error creating table: \(String(cString: sqlite3_errmsg(database)!))")
        }
    }
    //method to create contents to the database
    func create() -> Int {
        connect()
        //first connect to the sqlite database
        var statement: OpaquePointer? = nil
        //insert method
        if sqlite3_prepare_v2(
            database,
            "INSERT INTO notes (content) VALUES ('Write a note!')",
            -1,
            &statement,
            nil
        ) == SQLITE_OK {
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Error inserting note")
            }
        }
        else {
            print("Error creating note insert statement")
        }
        //finish the statement
        sqlite3_finalize(statement)
        return Int(sqlite3_last_insert_rowid(database))
    }
    // method to get all the contents from the database
    func getNotes() -> [Note] {
        connect()
        //empty result list
        var result: [Note] = []
        var statement: OpaquePointer? = nil
        //method to select the desired data
        if sqlite3_prepare_v2(database, "SELECT rowid, content FROM notes", -1, &statement, nil) == SQLITE_OK {
            //using while loop to iterate every available row
            while sqlite3_step(statement) == SQLITE_ROW {
                //adding each available selection to result list
                //creating a Note object with an ID that includes a sqlite3 built in function sqlite3_column_int that has 2 parameters, contents that inqludes another built in sqlite3 function wrapped inside a String
                result.append(Note(
                    id: sqlite3_column_int(statement, 0),
                    content: String(cString: sqlite3_column_text(statement, 1))
                ))
            }
        }
        //finish the sqlite statement
        sqlite3_finalize(statement)
        return result
    }
    // function that saves the notes
    func saveNote(note: Note) {
        connect()
        
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(
            database,
            "UPDATE notes SET content = ? WHERE rowid = ?",
            -1,
            &statement,
            nil
        ) == SQLITE_OK {
            //bind method that binds data to sqlite query
            sqlite3_bind_text(statement, 1, NSString(string: note.content).utf8String, -1, nil)
            sqlite3_bind_int(statement, 2, note.id)
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Error saving note")
            }
        }
        else {
            print("Error creating note update statement")
        }
        
        sqlite3_finalize(statement)
    }
    //function that deletes notes
    func delete(note: Note)->Bool{
        connect()
        
        var statement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, "DELETE FROM notes WHERE rowid = ?", -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_int(statement, 1, note.id)
            if sqlite3_step(statement) != SQLITE_DONE{
                print("Error deleting note")
            }
        }
        else{
            print("Error deleting note")
        }
        sqlite3_finalize(statement)
        return true
    }
}
