//
//  JustSoYouKnowView.swift
//  CitizenCheck
//
//  Created by Nicole Hong on 2020/12/03.
//

import Foundation
import SwiftUI

struct JustSoYouKnowView: View {
    var body: some View {
        
        VStack{
            Text("Just so you know").font(.custom("Futura", size: 22)).foregroundColor(Color(red: 0.7294117647058823, green: 0.5254901960784314, blue: 0.00784313725490196)).multilineTextAlignment(.leading)
                .padding(.leading, -88.0)
            Text("The Naturalization filing fee costs $750. You may be eligible for a fee reduction or waiver if you are a military applicant, above 75 years old, or cannot afford the fee.").font(.custom("Futura", size: 18))
                .foregroundColor(Color(red: 0.7294117647058823, green: 0.5254901960784314, blue: 0.00784313725490196))
                .multilineTextAlignment(.leading)
                .padding(.all, 29.0)
            //TODO: click to answer additional Qs view button
        }
    }
}

struct JustSoYouKnowView_Previews: PreviewProvider {
    static var previews: some View {
        JustSoYouKnowView()
            
    }
}
