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
    
    enum State {
        case intro, questions
    }
    
    @Published var state : State = .intro
    
    private let questions : [EligibilityQuestion]
    private var currentQuestionIndex = 0 {
        didSet {
            self.currentQuestion = questions[currentQuestionIndex]
        }
    }
    
    private var requiredDocIds = [0, 1]
    
    var appData : AppData
    
    init(appData: AppData) {
        self.appData = appData
        self.questions = appData.checklistQuestions
        
        self.currentQuestionIndex = 0
        self.currentQuestion = questions[currentQuestionIndex]
    }
    
    func next() {
        // If yes, add to list of required docs
        if currentQuestion.response == "Yes" {
            requiredDocIds.append(contentsOf: appData.questionToDoc[currentQuestionIndex] ?? [])
        }
        
        // Logic for additional questions if needed
        if self.currentQuestionIndex == 8 {
            if currentQuestion.response == "Yes" {
                currentQuestionIndex += 1
            }
            else {
                currentQuestionIndex = 10
            }
        }
        
        else if self.currentQuestionIndex == 10 {
            if currentQuestion.response == "Yes" {
                currentQuestionIndex += 1
            }
            else {
                currentQuestionIndex = 15
            }
        }
        
        // Logic for end of questions
        else if self.currentQuestionIndex == 16 {
            appData.saveRequiredDocuments(requiredDocIds)
            appData.state = .checklist
            appData.saveState(.checklist)
        }
        
        else {
            self.currentQuestionIndex += 1
        }
    }
}
