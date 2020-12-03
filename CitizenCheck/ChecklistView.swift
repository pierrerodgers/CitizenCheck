//
//  ChecklistView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 28/11/20.
//

import SwiftUI

struct ChecklistView: View {
    @ObservedObject var model : ChecklistViewModel
    
    var body: some View {
        VStack{
            Text("CHECKLIST").font(.custom("Futura", size:22)).fontWeight(.semibold).foregroundColor(Color(red: 0.011764705882352941, green: 0.11764705882352941, blue: 0.3254901960784314)).padding(.top, -12.0)
            List {
                Section(header:Text("Foundational Documents").font(.custom("Futura", size:18))
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 0.03529411764705882, green: 0.6274509803921569, blue: 0.09411764705882353))){
                    
                    ForEach(model.documents, id:\.id) { document in
                        ChecklistItem(model:self.model, document: document)
                    }.buttonStyle(PlainButtonStyle())
                    .foregroundColor(Color(red: 0.011764705882352941, green: 0.11764705882352941, blue: 0.3254901960784314))
                }
                
                Section(header:Text("Completed").font(.custom("Futura", size:18))
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 0.011764705882352941, green: 0.11764705882352941, blue: 0.3254901960784314))){
                    ForEach(model.completedDocuments, id:\.id) { document in
                        ChecklistItem(model: self.model, document: document)
                    }.buttonStyle(PlainButtonStyle())
                    .foregroundColor(Color(red: 0.011764705882352941, green: 0.11764705882352941, blue: 0.3254901960784314))
                }
            }.padding(.top, -5.0).listStyle(InsetGroupedListStyle())
            
        }
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var model = ChecklistViewModel()
    
    static var previews: some View {
        ChecklistView(model: model)
    }
}
