//
//  EligibilityViewModel.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 19/11/20.
//

import Foundation
import SwiftUI

class EligibilityViewModel : ObservableObject {
    @Published var currentQuestion : EligibilityQuestion
    @Published var state : EligibilityViewModel.State = .pending
    
    private let questions : [EligibilityQuestion]
    private var currentQuestionIndex = 0
    
    enum State {
        case ineligible, pending, elibile
    }
    
    
    init() {
        let question1 = EligibilityQuestion(question: "Are you at least 18 years old?", options: ["Yes","No"])
        let question2 = EligibilityQuestion(question: "Are you a lawful permanent resident (green card holder)?", options: ["Yes", "No"])
        
        let question3 = EligibilityQuestion(question: "How long have you been a lawful permanent resident?", options: ["Under five years", "Five years or more"])
        
        self.questions = [question1, question2, question3]
        
        self.currentQuestionIndex = 0
        self.currentQuestion = questions[currentQuestionIndex]
    }
    
    
    func next() {
        self.currentQuestionIndex += 1
        self.currentQuestion = questions[currentQuestionIndex]
    }
    
    
}
