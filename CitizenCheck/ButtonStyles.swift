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
        configuration.label.padding(15)
            .background(selectedOption == option ?  Color.blue : nil)
    }
}
