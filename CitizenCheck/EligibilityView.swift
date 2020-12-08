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
                DisclaimerView()
                Button(action: {model.state = .pending}) {
                    Text("Next")
                }.buttonStyle(ActionButtonStyle())
            }
            
        case .pending:
            VStack(alignment:.center) {
                EligibilityQuestionView(question: $model.currentQuestion).background(Color.white).cornerRadius(10).shadow(radius: 3)
                
                Button("Next", action:model.next).buttonStyle(ActionButtonStyle())
            }
        case .ineligible:
            VStack (alignment:.center){
                Text("You are NOT eligible to apply for citizenship").font(.custom("Futura", size:25))
                    .foregroundColor(Color(red: 0.6588235294117647, green: 0.0784313725490196, blue: 0.0784313725490196))
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.7568627450980392, blue: 0.7568627450980392)/*@END_MENU_TOKEN@*/)
                    .padding()
                Button(action:model.restart) {
                    Text("Restart")
                }.buttonStyle(ActionButtonStyle())
            }
            
        
        case .eligible:
            VStack{
                Text("You are now ready to start gathering the documents you need for your N-400 Application for Naturalization!").font(.custom("Futura", size:25))
                    .foregroundColor(Color(red: 0.058823529411764705, green: 0.3333333333333333, blue: 0.08627450980392157))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.6941176470588235, green: 0.9450980392156862, blue: 0.7176470588235294)/*@END_MENU_TOKEN@*/)
                    .padding()
                Button(action:model.goToChecklistQuestions) {
                    Text("Get Started").font(.custom("Futura", size:20))
                        .multilineTextAlignment(.trailing)
                }
                //TO DO: click to next view (just so you know view)
            }
        }
        
        
    }
}

struct EligibilityView_Previews: PreviewProvider {
    static var previews: some View {
        EligibilityView(model: EligibilityViewModel(appData: AppData()))
    }
}
