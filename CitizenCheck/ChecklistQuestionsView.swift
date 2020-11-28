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
                Text("Next")
            }

        }
    }
}
/*
struct ChecklistQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistQuestionsView()
    }
}
*/
