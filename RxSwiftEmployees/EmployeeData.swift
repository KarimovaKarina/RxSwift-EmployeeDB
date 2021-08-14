import Foundation

struct EmployeesList: Codable {
    let employees: [EmployeeData]
}

struct EmployeeData: Codable {
    let firstName: String
    let lastName: String
    let position: String
    let contactDetails: Contact
    let projects: [String]?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "fname"
        case lastName = "lname"
        case position
        case contactDetails = "contact_details"
        case projects
    }
}

struct Contact: Codable {
    let email: String
    let phone: String?
}

