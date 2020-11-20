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
    private var currentQuestionIndex = 0 {
        didSet {
            self.currentQuestion = questions[currentQuestionIndex]
        }
    }
    
    enum State {
        case ineligible, pending, eligible
    }
    
    
    init() {
        let question0 = EligibilityQuestion(question: "Are you at least 18 years old?", options: ["Yes","No"], id:0)
        let question1 = EligibilityQuestion(question: "Are you a lawful permanent resident (green card holder)?", options: ["Yes", "No"], id:1)
        let question2 = EligibilityQuestion(question: "How long have you been a lawful permanent resident?", options: ["Under five years", "Five years or more"], id:2)
        let question3 = EligibilityQuestion(question: "Do any of these apply: ", options:["Yes", "No"], id:3)
        let question4 = EligibilityQuestion(question: "Have you had a continuous residence in the U.S. for at least the past 5 years?", options:["Yes", "No"], id:4)
        let question5 = EligibilityQuestion(question: "Have you been physically present in the U.S. for at least 30 months of the past 5 years?", options:["Yes", "No"], id:5)
        let question6 = EligibilityQuestion(question: "Are you a male between the ages of 18-25?", options:["Yes", "No"], id:6)
        
        self.questions = [question0, question1, question2, question3, question4, question5, question6]
        
        self.currentQuestionIndex = 0
        self.currentQuestion = questions[currentQuestionIndex]
    }
    
    
    func next() {
        if currentQuestion.id == 2 {
            if currentQuestion.response == "Under five years" {
                currentQuestionIndex = 3
            }
            else {
                currentQuestionIndex = 4
            }
        }
        
        else if currentQuestion.id == 3 {
            if currentQuestion.response == "No" {
                self.state = .ineligible
            }
            else {
                currentQuestionIndex += 1
            }
        }
        
        else if currentQuestion.id < 2 || (currentQuestion.id > 2 && currentQuestion.id < 6) {
            if currentQuestion.response == "No" {
                self.state = .ineligible
            }
            else {
                currentQuestionIndex += 1
            }
        }
        
        else if currentQuestion.id == 6 {
            if currentQuestion.response == "No" {
                self.state = .eligible
            }
        }
    }
    
    func restart() {
        self.currentQuestionIndex = 0
        self.state = .pending
    }
    
    
}