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
        
            Image("logo1")
                .resizable()
                .frame(width: 100.0, height: 101.0)
           
            Text("Welcome to").font(.custom("Futura", size: 20)).fontWeight(.regular).foregroundColor(Color(red: 0.011764705882352941, green: 0.11764705882352941, blue: 0.3254901960784314))
            
            Text("CitizenCheck").font(.custom("Futura", size: 40)).fontWeight(.semibold).foregroundColor(Color(red: 0.011764705882352941, green: 0.11764705882352941, blue: 0.3254901960784314)).padding(.top, -11.0)
            
        }
        .padding(.top, -40.0)
    //TODO: click to disclaimer button
        }
    }

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .padding()
            
            
            
    }
}
