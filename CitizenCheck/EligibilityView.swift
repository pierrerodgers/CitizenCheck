//
//  EligibilityView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 19/11/20.
//

import SwiftUI

struct EligibilityView: View {
    @ObservedObject var model : EligibilityViewModel
    
    var body: some View {
        VStack(alignment:.center) {
            EligibilityQuestionView(question: $model.currentQuestion)
            
            Button(action: model.next) {
                Text("Next")
            }

        }
    }
}

struct EligibilityView_Previews: PreviewProvider {
    static var previews: some View {
        EligibilityView(model: EligibilityViewModel())
    }
}
