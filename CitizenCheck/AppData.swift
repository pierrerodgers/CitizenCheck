//
//  AppData.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 30/11/20.
//

import Foundation
import SwiftUI

class AppData : ObservableObject {

    // Holds the state of the app overall
    // i.e. is the user still filling the eligibility questions, or the checklist questions, or are they up to the checklist
    enum AppState {
        case eligibility, checklistQuestions, checklist
    }

    @Published var state : AppState

    // The list of all eligiblity questions
    var eligibilityQuestions : [EligibilityQuestion]

    // The list of all checklist questions
    var checklistQuestions : [EligibilityQuestion]


    // The dict of all the potential documents (stored by ID)
    var documents : Dictionary<Int, Document>

    // The dict of the documents required by the user (stored by ID)
    var requiredDocuments : Dictionary<Int, Document>

    // The list of uncompleted documents
    @Published var uncompletedDocuments : [Document]
    
    // The list of completed documents
    @Published var completedDocuments : [Document]

    init() {

        // Initialise the eligibility questions
        let question0 = EligibilityQuestion(question: "Are you at least 18 years old?", options: ["Yes","No"], id:0)
        let question1 = EligibilityQuestion(question: "Are you a lawful permanent resident (green card holder)?", options: ["Yes", "No"], id:1)
        let question2 = EligibilityQuestion(question: "How long have you been a lawful permanent resident?", options: ["Under five years", "Five years or more"], id:2)
        let question3 = EligibilityQuestion(question: "Do any of these apply: ", options:["Yes", "No"], id:3)
        let question4 = EligibilityQuestion(question: "Have you had a continuous residence in the U.S. for at least the past 5 years?", options:["Yes", "No"], id:4)
        let question5 = EligibilityQuestion(question: "Have you been physically present in the U.S. for at least 30 months of the past 5 years?", options:["Yes", "No"], id:5)
        let question6 = EligibilityQuestion(question: "Are you a male between the ages of 18-25?", options:["Yes", "No"], id:6)

        self.eligibilityQuestions = [question0, question1, question2, question3, question4, question5, question6]


        // TO COMPLETE: Initialise the checklist questions (from Google Doc)
        let checklistQuestion0 = EligibilityQuestion(question: "Do you live outside of the US?", options: ["Yes","No"], id:0)
        let checklistQuestion1 = EligibilityQuestion(question: "Is an attorney acting for you?", options: ["Yes", "No"], id:1)
        let checklistQuestion2 = EligibilityQuestion(question: "Is your legal name different from the name on your Permanent Resident Card?", options: ["Yes", "No"], id:2)
        let checklistQuestion3 = EligibilityQuestion(question: "Were you married before?", options:["Yes", "No"], id:3)
        let checklistQuestion4 = EligibilityQuestion(question: "Have you taken any trip outside of the US longer than 6 months since becoming a permanent resident?", options:["Yes", "No"], id:4)
        let checklistQuestion5 = EligibilityQuestion(question: "Do you have a dependent spouse or kid(s) who do not live with you?", options:["Yes", "No"], id:5)
        let checklistQuestion6 = EligibilityQuestion(question: "Are you applying for an exception to the testing requirement based on a disability?", options:["Yes", "No"], id:6)
        let checklistQuestion7 = EligibilityQuestion(question: "Are you 1) male, 2) older than 26 and 3) did not register with the Selective Service while living in the US between ages of 18 and 26?", options:["Yes", "No"], id:7)
        let checklistQuestion8 = EligibilityQuestion(question: "Have you ever failed to file income taxes since becoming a Permanent Resident?", options:["Yes", "No"], id:8)
        let checklistQuestion9 = EligibilityQuestion(question: "Have you ever been arrested or detained by law enforcement?", options:["Yes", "No"], id:9)
        let checklistQuestion10 = EligibilityQuestion(question: "Are you applying on the basis of marriage to a US citizen?", options:["Yes", "No"], id:10)
        let checklistQuestion11 = EligibilityQuestion(question: "Are you seeking citizenship on the basis of US military service?", options:["Yes", "No"], id:11)
        
        
        self.checklistQuestions = [checklistQuestion0, checklistQuestion1, checklistQuestion2, checklistQuestion3, checklistQuestion4, checklistQuestion5, checklistQuestion6, checklistQuestion7, checklistQuestion8, checklistQuestion9, checklistQuestion10, checklistQuestion11]
        

        // TO COMPLETE: Initialise all documents (from Google Doc)
        self.documents = Dictionary<Int, Document>()
        self.requiredDocuments = Dictionary<Int, Document>()

        // App State
        self.state = .eligibility
        
        // Initialise document lists
        self.uncompletedDocuments = [Document(title: "A check or money order for the application fee & biometric services fee", description: "See N-400 form for more info and details: https://www.uscis.gov/n-400. Write your A-Number (listed on your Permanent Resident Card) on the back of the check or money order.", completed: false, id: 0)]
        
        self.completedDocuments = [Document(title: "A photocopy of both sides of your Permanent Resident Card (aka Green Card). ", description: "If you have lost the card, submit a photocopy of the receipt of your Form I-90 (Application to Replace Permanent Resident Card)", completed: true, id: 1)]

    }

    func saveEligbility(_ isEligible:Bool) {
        // TO COMPLETE: Use UserDefaults to save whether or not the user is eligible for citizenship or not

        UserDefaults.standard.set(isEligible, forKey: "isEligible")
    }

    func saveRequiredDocuments(_ documents:[Document]) {
       // TO COMPLETE: Use UserDefaults to save a list of the ids of the required documents based on the
        // checklist question answers
        var indexId = [Int]()
        for doc in documents {
            indexId.append(doc.id)
        }
        UserDefaults.standard.set(indexId, forKey: "requiredDocuments")
    }

    
    func completeDocument(_ document: Document) {
        // TO COMPLETE: Use UserDefaults to keep track of completed documents

        // I think we should just keep track of the IDs of the completed and incomplete documents
        if let completeDocumentIds = (UserDefaults.standard.array(forKey: "documents")
                                        as? [Int]) {
            var documentIds = completeDocumentIds
            documentIds.append(document.id)
            UserDefaults.standard.set(documentIds, forKey:"documents")
        } else { // no data stored for key "completeDocuments" in UserDefaults
            var documentIds = [Int]()
            documentIds.append(document.id)
            UserDefaults.standard.set(documentIds, forKey:"documents")
        }
    }

    func uncompleteDocument(_ document: Document) {
        // TO COMPLETE: Use UserDefaults to keep track of completed documents

        // I think we should just keep track of the IDs of the completed and incomplete documents
        if let completeDocumentIds = (UserDefaults.standard.array(forKey: "documents")
                                        as? [Int]) {
            var documentIds = completeDocumentIds
            if let index = documentIds.firstIndex(where: {$0 == document.id}) {
              documentIds.remove(at: index)
            }
            UserDefaults.standard.set(documentIds, forKey:"documents")
        } else { // no data stored for key "completeDocuments" in UserDefaults
            // do nothing
        }

    }
}
