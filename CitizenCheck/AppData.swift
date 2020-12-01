//
//  AppData.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 30/11/20.
//

import Foundation


class AppData {
    
    // Holds the state of the app overall
    // i.e. is the user still filling the eligibility questions, or the checklist questions, or are they up to the checklist
    enum AppState {
        case eligibility, checklistQuestions, checklist
    }
    
    var state : AppState
    
    
    // The list of all eligiblity questions
    var eligibilityQuestions : [EligibilityQuestion]
    
    // The list of all checklist questions
    var checklistQuestions : [EligibilityQuestion]
    
    
    // The dict of all the potential documents (stored by ID)
    var documents : Dictionary<Int, Document>
    
    // The dict of the documents required by the user (stored by ID)
    var requiredDocuments : Dictionary<Int, Document>
    
    
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
        
        
        // TO COMPLETE: Initialise all documents (from Google Doc)
        
        
        
    }
    
    func saveEligbility(_ isEligible:Bool) {
        // TO COMPLETE: Use UserDefaults to save whether or not the user is eligible for citizenship or not
        
        
    }
    
    func saveRequiredDocuments(_ documents:[Document]) {
        // TO COMPLETE: Use UserDefaults to save a list of the ids of the required documents based on the
        // checklist question answers
        
        
    }
    
    
    func completeDocument(_ document: Document) {
        // TO COMPLETE: Use UserDefaults to keep track of completed documents
        
        // I think we should just keep track of the IDs of the completed and incomplete documents
        
        
    }
    
    func uncompleteDocument(_ document: Document) {
        // TO COMPLETE: Use UserDefaults to keep track of completed documents
        
        // I think we should just keep track of the IDs of the completed and incomplete documents

        
    }
    
    
    
}
