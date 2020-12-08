//
//  ButtonStyles.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 18/11/20.
//

import Foundation
import SwiftUI

struct ToggleButtonStyle : ButtonStyle {
    
    var option : String
    var selectedOption : String?
    
    func makeBody(configuration: Configuration) -> some View {
        
        if selectedOption == option {
            return AnyView(configuration.label.padding(15).background(Color(red: 116/255, green: 185/255, blue: 255/255)).cornerRadius(10))
        }
        else {
            return AnyView(configuration.label.padding(15).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color(red: 116/255, green: 185/255, blue: 255/255))))
        }
        
       // configuration.label.padding(15)
            //.background(selectedOption == option ?  Color.blue : nil)
    }
}

struct ActionButtonStyle: ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundColor(Color(red: 116/255, green: 185/255, blue: 255/255)).font(.custom("Futura Bold", size: 20))
    }
}
