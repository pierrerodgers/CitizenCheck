//
//  LaunchScreenView.swift
//  CitizenCheck
//
//  Created by Nicole Hong on 2020/12/03.
//

import Foundation
import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        
        VStack(alignment: .center){
        
            Image("naturalize")
                .resizable()
                .frame(width: 300.0, height: 140.0)
           
            Text("A customized citizenship checklist app").font(.custom("Futura", size: 13)).fontWeight(.regular).foregroundColor(Color(hue: 0.343, saturation: 0.901, brightness: 0.618)).multilineTextAlignment(.center).padding(.top, -26.0)
        
        }
        .padding(.top, -45.0)
    //TODO: click to disclaimer button
        }
    }

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .padding()
            
            
            
    }
}
