import Foundation

//Model 
class Student {
    var name: String 
    var age: Int 
    var grade: String 

    init(name: String, age: Int, grade: String) {
        self.name = name 
        self.age = age 
        self.grade = grade 
    }
}

class FieldTrip {
    var name: String 
    var description: String 
    var date: Date 
    var students: [Student]

    init(name: String, description: String, date: Date, students: [Student]) {
        self.name = name 
        self.description = description 
        self.date = date 
        self.students = students 
    }
}

//Data Source 
class StudentDataSource {
    var students = [Student]()

    func addStudent(_ name: String, _ age: Int, _ grade: String) {
        let student = Student(name: name, age: age, grade: grade)
        students.append(student)
    }
}

class FieldTripDataSource {
    var fieldTrips = [FieldTrip]()

    func addFieldTrip(_ name: String, _ description: String, _ date: Date, _ students: [Student]) {
        let fieldTrip = FieldTrip(name: name, description: description, date: date, students: students)
        fieldTrips.append(fieldTrip)
    }
}

//Controller 
class FieldTripController {
    var studentDataSource = StudentDataSource()
    var fieldTripDataSource = FieldTripDataSource()

    func addStudent(_ name: String, _ age: Int, _ grade: String) {
        studentDataSource.addStudent(name, age, grade)
    }

    func addFieldTrip(_ name: String, _ description: String, _ date: Date, _ students: [Student]) {
        fieldTripDataSource.addFieldTrip(name, description, date, students)
    }
}

//Service 
class FieldTripService {
    var fieldTripController = FieldTripController()

    func createFieldTrip(_ name: String, _ description: String, _ date: Date, _ students: [Student]) {
        //validate input 
        if name.isEmpty || description.isEmpty || date == nil || students.isEmpty {
            print("Field trip info invalid")
            return
        }

        //add field trip
        fieldTripController.addFieldTrip(name, description, date, students)

        //update UI
        print("Create field trip successfully!")
    }
}

//View
class FieldTripView {
    var fieldTripService = FieldTripService()

    func createFieldTrip() {
        print("Create field trip with student info: ")
        print("Name: John")
        print("Age: 12")
        print("Grade: 6th")

        //get student info
        let name = "John"
        let age = 12
        let grade = "6th"

        //create student
        fieldTripService.fieldTripController.addStudent(name, age, grade)
        let students = [fieldTripService.fieldTripController.studentDataSource.students.last!]

        //create field trip 
        let name = "Explore The World"
        let description = "An educational program that provides students with the opportunity to explore the world around them through guided field trips and experiential learning."
        let date = Date()
        fieldTripService.createFieldTrip(name, description, date, students)
    }
}


//Util 
class DateUtil {
    static func getCurrentDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm"
        return dateFormatter.date(from: Date().description(with: .current))!
    }
}

class FieldTripUtil {
    static func validateFieldTrip(_ name: String, _ description: String, _ date: Date, _ students: [Student]) -> Bool {
        if name.isEmpty || description.isEmpty || students.isEmpty || date == nil {
            return false
        }
        return true 
    }
}


//View Controller 
class FieldTripViewController {
    var fieldTripView = FieldTripView()

    func createFieldTripAction() {
        fieldTripView.createFieldTrip()
    }
}

//Main 
let fieldTripViewController = FieldTripViewController()
fieldTripViewController.createFieldTripAction()