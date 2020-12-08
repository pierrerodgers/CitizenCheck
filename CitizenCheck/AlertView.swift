//
//  AlertView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 8/12/20.
//

import SwiftUI

struct AlertView: View {
    enum AlertType {
        case warning, information, success, disclaimer
    }
    
    var text : String
    var actionText : String
    var type : AlertType
    
    var color : Color {
        get {
            if type == .warning || type == .disclaimer {
                return Color(red: 0.6588235294117647, green: 0.0784313725490196, blue: 0.0784313725490196)
            }
            if type == .success{
                return Color(red: 0.058823529411764705, green: 0.3333333333333333, blue: 0.08627450980392157)
            }
            return Color(red: 0.7294117647058823, green: 0.5254901960784314, blue: 0.00784313725490196)
        }
    }
    
    var action : () -> ()
    
    var body: some View {
        if type == .disclaimer {
            VStack{
                Text("Disclaimer").font(.custom("Futura", size:22)).foregroundColor(color)
                Text(text).font(.custom("Futura", size: 18))
                
                Button(action:action) {
                    Text(actionText)
                }.buttonStyle(ActionButtonStyle())
                
            }.padding()
            
            
        }
        else if type == .information {
            VStack{
                Text("Just so you know").font(.custom("Futura", size:22)).foregroundColor(color)
                Text(text).font(.custom("Futura", size: 18))
                
                Button(action:action) {
                    Text(actionText)
                }.buttonStyle(ActionButtonStyle())
                
            }.padding()
        }
        else {
            VStack (alignment:.center){
                
                
                Text(text).font(.custom("Futura", size:22))
                    .foregroundColor(color)
                    .multilineTextAlignment(.center).padding(20)
                    .background(color.opacity(0.2)).cornerRadius(10).padding()
                    
                Button(action:action) {
                    Text(actionText)
                }.buttonStyle(ActionButtonStyle())
            }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(text: "You are NOT eligible to apply for citizenship", actionText: "Restart", type: .warning, action: {})
    }
}
