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
        VStack(alignment:.center) {
            EligibilityQuestionView(question: $model.currentQuestion)
            
            Button(action: model.next) {
                Text("Next").font(.custom("Futura", size:20))
            }

        }
    }
}

struct ChecklistQuestionsView_Previews:PreviewProvider {

    static var model = ChecklistQuestionsViewModel()

    static var previews: some View {
        ChecklistQuestionsView(model: model)
    }
}
