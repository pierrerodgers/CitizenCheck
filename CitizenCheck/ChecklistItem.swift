//
//  ChecklistItem.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 28/11/20.
//

import SwiftUI

struct ChecklistItem: View {
    @ObservedObject var model : ChecklistViewModel
    
    @State var document : Document
    @State var showDescription = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Check(isChecked: $document.completed).onTapGesture {
                    if document.completed {
                        model.uncompleteDocument(document.id)
                    }
                    else {
                        model.completeDocument(document.id)
                    }
                    
                }
                Text(document.title).bold()
                Spacer()
            }
            Button(action:{
                showDescription.toggle()
            }) {
                if (showDescription) {
                    Text("Hide details")
                }
                else {
                    Text("See details")
                }
                
            }.padding(.leading)
            
            if(showDescription) {
                Text(document.description)
            }
        }
    }
}


struct Check : View {
    @Binding var isChecked : Bool
    
    var body : some View {
        switch(isChecked) {
        case true:
            Image(systemName: "checkmark.circle.fill").font(.system(size: 30))
        case false:
            Image(systemName: "checkmark.circle").font(.system(size: 30))
        }
        
    }
}

struct ChecklistItem_Previews: PreviewProvider {
    static var testDoc = Document(title: "Include two identical color photographs with your name and A-Number written lightly in pencil on the back of each photo.", description: "See Part 5 of Form M-476 (A Guide to Naturalization) and Form N-400 (Application for Naturalization) for more details about photo requirements.", completed: false)
    
    static var model = ChecklistViewModel()
    
    static var previews: some View {
        ChecklistItem(model:model, document: testDoc)
    }
}
