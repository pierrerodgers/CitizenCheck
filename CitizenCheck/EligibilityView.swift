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
        case .launch:
            VStack{
                LaunchScreenView()
                Button("Next", action: {model.state = .disclaimer}).buttonStyle(ActionButtonStyle())
            }
        case .disclaimer:
            VStack{
                AlertView(text: "This is app is not an authorized legal service. We recommend further consultation with immigration/legal professionals to be sure about required documents and processes.", actionText: "Next", type: .disclaimer, action: {model.state = .pending})
            }
            
        case .pending:
            VStack(alignment:.center) {
                EligibilityQuestionView(question: $model.currentQuestion).background(Color.white).cornerRadius(10).shadow(radius: 3)
                
                Button("Next", action:model.next).buttonStyle(ActionButtonStyle())
            }.padding()
        case .ineligible:
            AlertView(text: "You are NOT eligible to apply for citizenship", actionText: "Restart", type: .warning, action: model.restart)
        
        case .eligible:
            AlertView(text: "You are now ready to start gathering the documents you need for your N-400 Application for Naturalization!", actionText: "Get started", type: .success, action: model.goToChecklistQuestions)
            
        }
        
        
    }
}

struct EligibilityView_Previews: PreviewProvider {
    static var previews: some View {
        EligibilityView(model: EligibilityViewModel(appData: AppData()))
    }
}
