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
            Text(question.question).font(.custom("Futura", size:25))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.012, green: 0.129, blue: 0.325)).multilineTextAlignment(.center)
                .padding()
            VStack (alignment:.center,spacing:15){
                ForEach(question.options, id:\.self) { option in
                    Button(action: {self.selectOption(option)}) {
                        Text(option).font(.custom("Futura", size:20))
                            .foregroundColor(Color(red: 0.012, green: 0.129, blue: 0.325)).multilineTextAlignment(.center)
                    }.buttonStyle(ToggleButtonStyle(option: option, selectedOption: question.response))
                    
                }
            }.padding()
        }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(.black))

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

