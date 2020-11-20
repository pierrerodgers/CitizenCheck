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
            return AnyView(configuration.label.padding(15).background(Color.blue))
        }
        else {
            return AnyView(configuration.label.padding(15).border(Color.blue, width: 2))
        }
        
       // configuration.label.padding(15)
            //.background(selectedOption == option ?  Color.blue : nil)
    }
}
