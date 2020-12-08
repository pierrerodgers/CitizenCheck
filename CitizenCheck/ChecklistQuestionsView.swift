//
//  ChecklistQuestionsView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 28/11/20.
//

import SwiftUI

struct ChecklistQuestionsView: View {
    @ObservedObject var model : ChecklistQuestionsViewModel
    
    var body: some View {
        switch(model.state) {
        case .intro:
            AlertView(text: "The Naturalization filing fee costs $750. You may be eligible for a fee reduction or waiver if you are a military applicant, above 75 years old, or cannot afford the fee.", actionText: "Get started", type: .information, action: {model.state = .questions})
            
        
        case .questions:
            VStack(alignment:.center) {
                EligibilityQuestionView(question: $model.currentQuestion).padding()
                
                Button("Next", action: model.next).buttonStyle(ActionButtonStyle())

            }
        }
    }
}

struct ChecklistQuestionsView_Previews:PreviewProvider {

    static var model = ChecklistQuestionsViewModel(appData: AppData())

    static var previews: some View {
        ChecklistQuestionsView(model: model)
    }
}
