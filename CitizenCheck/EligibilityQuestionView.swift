//
//  EligibilityQuestionView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 18/11/20.
//

import SwiftUI

struct EligibilityQuestionView: View {
    @Binding var question : EligibilityQuestion
    
    var body: some View {
        VStack(alignment:.center, spacing:10){
            Text(question.question).font(.title).multilineTextAlignment(.center)
            VStack{
                ForEach(question.options, id:\.self) { option in
                    Button(action: {self.selectOption(option)}) {
                        Text(option)
                    }.buttonStyle(ToggleButtonStyle(option: option, selectedOption: question.response))
                }
            }
        }
    }
    
    func selectOption(_ option:String) {
        question.response = option
    }
}

struct EligibilityQuestionView_Previews: PreviewProvider {
    @State static var question = EligibilityQuestion(question:"How long have you been a lawful permanent resident?", options: ["Less than five years", "Five years or more"])
    
    static var previews: some View {
        EligibilityQuestionView(question:$question)
    }
}

