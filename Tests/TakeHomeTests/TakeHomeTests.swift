import XCTest
@testable import TakeHome

final class TakeHomeTests: XCTestCase {
    
    private var th = TakeHome()
    
    func testBookExists() throws {
        
        // Validate title of AppBook
        XCTAssertTrue(th.example_book.title == "Intro to Spanish Book 1")
        
        // Validate pages for those editions exist
        XCTAssertTrue(th.example_book.pages.count > 0)
    }
    
    func testTeacherExists() throws {
        // Validate the name of the teacher
        XCTAssertTrue(th.example_teacher.name == "Sēnor Ben Cheng")
    }
    
    func testStudentsExist() throws {
        // Validate students exist
        XCTAssertTrue(th.example_students.count > 0)
    }
    
    func testPopulateStudentAnswers() throws {
        let student = Student(name: "Test Student")
        let page = Page(title: "Test Page")
        
        student.enterAnswer(for: page, type: .standard)
        
        // Validate an answer exists
        XCTAssertTrue(student.answers.count == 1)
        
        // Validate that the page id's are the same
        XCTAssertTrue(page.id == student.answers[0].pageID)
        
        // Validate that the value is accurate
        XCTAssertTrue(student.answers[0].score == 0.5)
    }
    
    /// Tests challenge two by showing that the teacher can be changed without affecting the rest of classroom
    func testChallengeTwo() throws {
        let example_book = Book(
            title: "Book Name",
            description: "This is an example book with fake pages",
            pages: [
                Page(title: "Page 1"),
                Page(title: "Page 2"),
                Page(title: "Page 3"),
            ]
        )
        
        let example_teacher: Teacher = Teacher(name: "Mr. John Doe")
        
        let example_students: [Student] = [
            Student(name: "Abed Nadir"),
            Student(name: "Britta Perry"),
            Student(name: "Troy Barnes"),
        ]
        
        let example_classroom =  Classroom(teacher: example_teacher, book: example_book)
        example_classroom.students = example_students
        let initialStudentNames = example_classroom.students[0].name + ", " + example_classroom.students[1].name + ", " + example_classroom.students[2].name
        
        let substitute_Teacher: Teacher = Teacher(name: "Ms. Jane Doe")
        example_classroom.substituteTeacher(teacher: substitute_Teacher)
        let finalStudentNames = example_classroom.students[0].name + ", " + example_classroom.students[1].name + ", " + example_classroom.students[2].name
        
        XCTAssertTrue(initialStudentNames.elementsEqual(finalStudentNames))
    }
}
