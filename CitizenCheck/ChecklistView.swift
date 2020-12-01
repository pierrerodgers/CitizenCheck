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
        List {
            Section(header:Text("Still to complete")){
                ForEach(model.documents, id:\.id) { document in
                    ChecklistItem(model:self.model, document: document)
                }.buttonStyle(PlainButtonStyle())
            }
            Section(header:Text("Completed")){
                ForEach(model.completedDocuments, id:\.id) { document in
                    ChecklistItem(model: self.model, document: document)
                }.buttonStyle(PlainButtonStyle())
            }
        }.listStyle(SidebarListStyle())
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var model = ChecklistViewModel()
    
    static var previews: some View {
        ChecklistView(model: model)
    }
}
