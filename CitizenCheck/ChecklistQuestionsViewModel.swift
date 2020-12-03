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
    
    var appData : AppData
    
    //TO COMPLETE to add the if statement questions for tax and arrest
    //TO COMPLETE logic flow
    init(appData: AppData) {
        self.appData = appData
        self.questions = appData.checklistQuestions
        
        self.currentQuestionIndex = 0
        self.currentQuestion = questions[currentQuestionIndex]
    }
    
    func next() {
        if self.currentQuestionIndex == 11 {
            appData.state = .checklist
        }
        else {
            self.currentQuestionIndex += 1
        }
    }
}
