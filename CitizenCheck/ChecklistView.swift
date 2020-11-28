//
//  ChecklistView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 28/11/20.
//

import SwiftUI

struct ChecklistView: View {
    @State var documents : [Document]
    @State var completedDocuments : [Document]
    
    var body: some View {
        List {
            Section(header:Text("Still to complete")){
                ForEach(documents, id:\.id) { document in
                    ChecklistItem(document: document)
                }.buttonStyle(PlainButtonStyle())
            }
            Section(header:Text("Completed")){
                ForEach(completedDocuments, id:\.id) { document in
                    ChecklistItem(document: document)
                }.buttonStyle(PlainButtonStyle())
            }
        }.listStyle(SidebarListStyle())
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var documents = [Document(title: "Include two identical color photographs with your name and A-Number written lightly in pencil on the back of each photo.", description: "See Part 5 of Form M-476 (A Guide to Naturalization) and Form N-400 (Application for Naturalization) for more details about photo requirements.", completed: false, id : 0), Document(title: "Complete G-28 Form", description: "Notice of Entry of Appearance as Attorney or Accredited Representative: https://www.uscis.gov/g-28", completed: false, id: 1)]
    
    static var completedDocuments = [Document(title: "A photocopy of both sides of your Permanent Resident Card (aka Green Card). ", description: "NOTE: If you have lost the card, submit a photocopy of the receipt of your Form I-90 (Application to Replace Permanent Resident Card)", completed: true, id: 0)]
    
    static var previews: some View {
        ChecklistView(documents: documents, completedDocuments: completedDocuments)
    }
}
