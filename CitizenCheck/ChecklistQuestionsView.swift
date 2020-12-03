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

//struct ChecklistQuestionsView_Previews: PreviewProvider {
//    
//    @State static var model = ChecklistQuestionsViewModel(question: "Do you live outside the US?", options: ["Yes", "No"])
//    
//    static var previews: some View {
//        ChecklistQuestionsView(model:$model)
//    }
//}
