//
//  ChecklistViewModel.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 29/11/20.
//
import Foundation
import SwiftUI

class ChecklistViewModel : ObservableObject {
    @Published var documents : [Document]
    @Published var completedDocuments : [Document]
    
    func completeDocument(_ documentId:Int) {
        let idx = documents.firstIndex { $0.id == documentId }!
        var document = documents[idx]
        document.completed = true
        documents.remove(at:idx)
        completedDocuments.append(document)
    }
    
    func uncompleteDocument(_ documentId:Int) {
        let idx = completedDocuments.firstIndex { $0.id == documentId }!
        var document = completedDocuments[idx]
        document.completed = false
        completedDocuments.remove(at:idx)
        documents.append(document)
    }
    
    init() {
        documents = [Document(title: "Include two identical color photographs with your name and A-Number written lightly in pencil on the back of each photo.", description: "See Part 5 of Form M-476 (A Guide to Naturalization) and Form N-400 (Application for Naturalization) for more details about photo requirements.", completed: false, id : 0), Document(title: "Complete G-28 Form", description: "Notice of Entry of Appearance as Attorney or Accredited Representative: https://www.uscis.gov/g-28", completed: false, id: 1)]
        
        completedDocuments = [Document(title: "A photocopy of both sides of your Permanent Resident Card (aka Green Card). ", description: "NOTE: If you have lost the card, submit a photocopy of the receipt of your Form I-90 (Application to Replace Permanent Resident Card)", completed: true, id: 2)]
    }
}
