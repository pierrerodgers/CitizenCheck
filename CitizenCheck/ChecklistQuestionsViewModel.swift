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
            // THIS NEEDS TO BE CHANGED
            appData.saveRequiredDocuments([Document(title: "A check or money order for the application fee & biometric services fee", description: "See N-400 form for more info and details: https://www.uscis.gov/n-400. Write your A-Number (listed on your Permanent Resident Card) on the back of the check or money order.", completed: false, id: 0), Document(title: "A photocopy of both sides of your Permanent Resident Card (aka Green Card). ", description: "If you have lost the card, submit a photocopy of the receipt of your Form I-90 (Application to Replace Permanent Resident Card)", completed: true, id: 1), Document(title: "Include document(s) that show you legally changed your name including marriage certificate, court document, etc.", description: "", completed: false, id: 2), Document(title: "Include proof that your earlier marriages ended (divorce decrees, annulments, or death certificate", description: "", completed: false, id: 3), Document(title: "Include evidence that you and your family still lived, worked or kept ties to the US, which could be:", description: "An IRS tax return listing information for the last 5 years", completed: false, id: 4)])
            appData.state = .checklist
            appData.saveState(.checklist)
        }
        else {
            self.currentQuestionIndex += 1
        }
    }
}
