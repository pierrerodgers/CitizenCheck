//
//  ChecklistQuestionsViewModel.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 28/11/20.
//

import Foundation
import SwiftUI

class ChecklistQuestionsViewModel : ObservableObject {
    @Published var currentQuestion: EligibilityQuestion
    
    private let questions : [EligibilityQuestion]
    private var currentQuestionIndex = 0 {
        didSet {
            self.currentQuestion = questions[currentQuestionIndex]
        }
    }
    
    //TO COMPLETE to add the if statement questions for tax and arrest
    //TO COMPLETE logic flow
    init() {
        let question0 = EligibilityQuestion(question: "Do you live outside of the US?", options: ["Yes","No"], id:0)
        let question1 = EligibilityQuestion(question: "Is an attorney acting for you?", options: ["Yes", "No"], id:1)
        let question2 = EligibilityQuestion(question: "Is your legal name different from the name on your Permanent Resident Card?", options: ["Yes", "No"], id:2)
        let question3 = EligibilityQuestion(question: "Were you married before?", options:["Yes", "No"], id:3)
        let question4 = EligibilityQuestion(question: "Have you taken any trip outside of the US longer than 6 months since becoming a permanent resident?", options:["Yes", "No"], id:4)
        let question5 = EligibilityQuestion(question: "Do you have a dependent spouse or kid(s) who do not live with you?", options:["Yes", "No"], id:5)
        let question6 = EligibilityQuestion(question: "Are you applying for an exception to the testing requirement based on a disability?", options:["Yes", "No"], id:6)
        let question7 = EligibilityQuestion(question: "Are you 1) male, 2) older than 26 and 3) did not register with the Selective Service while living in the US between ages of 18 and 26?", options:["Yes", "No"], id:7)
        let question8 = EligibilityQuestion(question: "Have you ever failed to file income taxes since becoming a Permanent Resident?", options:["Yes", "No"], id:8)
        let question9 = EligibilityQuestion(question: "Have you ever been arrested or detained by law enforcement?", options:["Yes", "No"], id:9)
        let question10 = EligibilityQuestion(question: "Are you applying on the basis of marriage to a US citizen?", options:["Yes", "No"], id:10)
        let question11 = EligibilityQuestion(question: "Are you seeking citizenship on the basis of US military service?", options:["Yes", "No"], id:11)
        
        
        self.questions = [question0, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11]
        
        self.currentQuestionIndex = 0
        self.currentQuestion = questions[currentQuestionIndex]
    }
    
    func next() {
        self.currentQuestionIndex += 1
    }
}
