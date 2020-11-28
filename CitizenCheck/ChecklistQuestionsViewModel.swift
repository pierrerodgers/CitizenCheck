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
    
    init() {
        self.currentQuestionIndex = 0
        self.questions = [EligibilityQuestion(question: "Test question", options: ["Yes", "No"])]
        self.currentQuestion = questions[currentQuestionIndex]
    }
    
    func next() {
        self.currentQuestionIndex += 1
    }
}
