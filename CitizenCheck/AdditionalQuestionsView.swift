//
//  JustSoYouKnowView.swift
//  CitizenCheck
//
//  Created by Nicole Hong on 2020/12/03.
//

import Foundation
import SwiftUI

struct AdditionalQuestionsView: View {
    var body: some View {
        
        VStack{
            Text("Please answer the following questions to help us determine what documents you will need for your application.").font(.custom("Futura", size: 20))
                .foregroundColor(Color(red: 0.011764705882352941, green: 0.11764705882352941, blue: 0.3254901960784314))
                .multilineTextAlignment(.leading)
                .padding(.all, 29.0)
            //TODO: click to answer checklistquestions view button
        }
    }
}

struct AdditionalQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalQuestionsView()
            
    }
}

