//
//  DisclaimerView.swift
//  CitizenCheck
//
//  Created by Nicole Hong on 2020/12/03.
//

import Foundation
import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        
        VStack{
            Text("Disclaimer:").font(.custom("Futura", size: 22)).foregroundColor(Color(red: 0.6588235294117647, green: 0.0784313725490196, blue: 0.0784313725490196)).multilineTextAlignment(.leading)
                .padding(.leading, -131.0)
            Text("This is app is not an authorized legal service. We recommend further consultation with immigration/legal professionals to be sure about required documents and processes.").font(.custom("Futura", size: 18))
                .foregroundColor(Color(red: 0.6588235294117647, green: 0.0784313725490196, blue: 0.0784313725490196))
                .multilineTextAlignment(.leading)
                .padding(.all, 26.0)
            //TODO: click to eligibility questions button
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
            
    }
}
