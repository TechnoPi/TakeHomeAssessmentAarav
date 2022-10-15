@main
public struct TakeHome {
    
    /// Our Book Object
    ///
    /// This is the main book of the application (for demonstration purposes). It contains two editions each with 10 pages.
    public var example_book = Book(
        title: "Intro to Spanish Book 1",
        description: "This is an example book with fake pages",
        pages: [
            Page(title: "Page 1"),
            Page(title: "Page 2"),
            Page(title: "Page 3"),
            Page(title: "Page 4"),
            Page(title: "Page 5"),
            Page(title: "Page 6"),
            Page(title: "Page 7"),
            Page(title: "Page 8"),
            Page(title: "Page 9"),
            Page(title: "Page 10"),
        ]
    )
    
    /// An example teacher to use for the assessment
    public var example_teacher: Teacher = Teacher(name: "Sēnor Ben Cheng")
    
    /// An example list of students
    public var example_students: [Student] = [
        Student(name: "Abed Nadir"),
        Student(name: "Britta Perry"),
        Student(name: "Troy Barnes"),
        Student(name: "Pierce Hawthorne"),
        Student(name: "Jeff Winger"),
        Student(name: "Annie Edison"),
        Student(name: "Shirley Bennett"),
    ]
    


    /// This is where you will run your code to ensure that it works as desired. Upon pressing the play button in Xcode (or running the script in terminal), the code in this function will be executed.
    public static func main() {
        
        let th = TakeHome()
        
        // Populate Student Data
        th.generateFakeStudentData(.randomized)
//        th.generateFakeStudentData(.standard) // Uncomment for non-random data
        
        th.challengeOne()
        th.challengeTwo()
        th.challengeThree()
    }
}

/// YOUR ANSWERS GO HERE !!
///
/// This is where you will write most of your code for the three challenges. Keep in mind that some of the challenges require you to make new files or change existing ones. If you have anything print to the terminal make sure it goes in here!!!
/// - Note: Feel free to delete any code in the functions below!
public extension TakeHome {

    func challengeOne() {
        print("Challenge 1 below:")
        print(example_students[0].name + ":")

        var i = 0
        for pages in example_book.pages {
            let score = example_students[0].answers[i].score
            let roundedScore = Int(score * 100)
            print(pages.title + ": " + "\(roundedScore)" + "%")
            i+=1
        }

        print("Book: \(example_book.title)\n")
    }
    
    func challengeTwo() {
        let example_classroom =  Classroom(teacher: example_teacher, book: example_book)
        example_classroom.students = example_students
        
        print("Challenge 2 below:")
        print("The current teacher is " + (example_classroom.teacher.name))
        print("The book used by the class is " + (example_classroom.book.title))
        print("One student in the class is " + example_classroom.students[0].name + "\n")
        
        // The teacher of the classroom can be substituded without impacting the students or book of the class
        let substitute_Teacher: Teacher = Teacher(name: "Sēnor John Doe")
        example_classroom.substituteTeacher(teacher: substitute_Teacher)
        print("The new teacher is " + (example_classroom.teacher.name))
        print("The book used by the class is " + (example_classroom.book.title))
        print("One student in the class is " + example_classroom.students[0].name + "\n")
    }
    
    func challengeThree() {
        let example_classroom =  Classroom(teacher: example_teacher, book: example_book)
        example_classroom.students = example_students
        
        print("Challenge 3 below:")
        print(example_classroom.sortPageAverage() + "\n")
        print(example_classroom.sortStudentAverage() + "\n")
    }
    
}

/// Helper Functions
///
/// This is where we have written some helper functions to set up your enviornment for you
public extension TakeHome {
    
    /// Generates some example data to use when writing your code
    ///
    /// This function goes through each student and generates some random answers to each page of the the two books
    func generateFakeStudentData(_ type: Answer.ScoreType) {
        for student in self.example_students {
            for page in self.example_book.pages {
                student.enterAnswer(for: page, type: type)
            }
        }
    }
}
