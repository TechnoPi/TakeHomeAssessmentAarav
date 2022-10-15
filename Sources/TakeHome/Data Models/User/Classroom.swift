//
//  Classroom.swift
//
//
//  Created by Aarav Nair on 10/13/22.
//

import Foundation

/// Classroom Object
///
/// The classroom has a teacher, book, and students. An instantiation of this class is made in `app.swift`
public class Classroom: Identifiable {

    /// The teacher object
    public private(set) var teacher: Teacher

    /// The book used by the class
    public private(set) var book: Book

    /// An array of students in the class
    public var students: [Student]

    public init(teacher: Teacher, book: Book) {
        self.teacher = teacher
        self.book = book
        self.students = []
    }

    /// An instance method that changes the teacher of the classroom
    func substituteTeacher(teacher: Teacher) {
        self.teacher = teacher
    }

    /// Helper method: Calculates the average score of all students on a certain page
    func pageAverage(pageNumber: Int) -> Int {
        var sum = 0.0
        for student in students {
            sum = sum + student.answers[pageNumber].score * 100
        }
        let roundedScore = Int(sum) / students.count
        return roundedScore
    }

    /// Helper method: Calculates the average score of a student on every page
    func studentAverage(studentIndex: Int) -> Int {
        var sum = 0.0

        var i = 0
        while i < book.pages.count {
            sum = sum + students[studentIndex].answers[i].score * 100
            i+=1
        }

        let roundedScore = Int(sum) / book.pages.count
        return roundedScore
    }

    /// Sorts every page by the average score ach
    func sortPageAverage() -> String {
        var averages = [String](repeating: "", count: book.pages.count)

        var i = 0
        while i < book.pages.count {
            averages[i] = "Page " + "\(i+1): " + "\(pageAverage(pageNumber: i))" + "%"
            i+=1
        }

    let sorted = averages.sorted {$0.suffix(from: $0.index($0.endIndex, offsetBy: -3)) > $1.suffix(from: $1.index($1.endIndex, offsetBy: -3))}


        return sorted.joined(separator: "\n")
    }

    /// Sorts every student by their average score accross all pages
    func sortStudentAverage() -> String {
        var averages = [String](repeating: "", count: students.count)

        var i = 0
        for student in students {
            averages[i] = student.name + ": " + "\(studentAverage(studentIndex: i))" + "%"
            i+=1
        }

        let sorted = averages.sorted {$0.suffix(from: $0.index($0.endIndex, offsetBy: -3)) > $1.suffix(from: $1.index($1.endIndex, offsetBy: -3))}

        return sorted.joined(separator: "\n")
    }
}
