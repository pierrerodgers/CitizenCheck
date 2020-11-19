//
//  EligibilityQuestionView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 18/11/20.
//

import SwiftUI

struct EligibilityQuestionView: View {
    @State var question : EligibilityQuestion = EligibilityQuestion()
    
    var body: some View {
        VStack(alignment:.center, spacing:10){
            Text(question.question).font(.title)
            HStack{
                ForEach(question.options, id:\.self) { option in
                    Button(action: {self.selectOption(option)}) {
                        Text(option)
                    }.buttonStyle(ToggleButtonStyle(option: option, selectedOption: question.response))
                }
            }
            
            
            Text("Next")
        }
    }
    
    func selectOption(_ option:String) {
        question.response = option
    }
}

struct EligibilityQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        EligibilityQuestionView()
    }
}
