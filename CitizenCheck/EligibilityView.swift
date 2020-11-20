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
        switch model.state {
        case .pending:
            VStack(alignment:.center) {
                EligibilityQuestionView(question: $model.currentQuestion)
                
                Button(action: model.next) {
                    Text("Next")
                }

            }
        case .ineligible:
            VStack{
                Text("You are not eligible to apply for citizenship").font(.title)
                
                Button(action:model.restart) {
                    Text("Restart")
                }
            }
        case .eligible:
            VStack{
                Text("You are eligible!").font(.title)
                Button(action:model.restart) {
                    Text("Restart")
                }
            }
        }
        
        
    }
}

struct EligibilityView_Previews: PreviewProvider {
    static var previews: some View {
        EligibilityView(model: EligibilityViewModel())
    }
}
