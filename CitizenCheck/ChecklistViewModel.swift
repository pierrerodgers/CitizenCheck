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
        documents = [Document(title: "A check or money order for the application fee & biometric services fee", description: "See N-400 form for more info and details: https://www.uscis.gov/n-400. Write your A-Number (listed on your Permanent Resident Card) on the back of the check or money order.", completed: false, id: 0)]
        
        completedDocuments = [Document(title: "A photocopy of both sides of your Permanent Resident Card (aka Green Card). ", description: "If you have lost the card, submit a photocopy of the receipt of your Form I-90 (Application to Replace Permanent Resident Card)", completed: true, id: 1)]
    }
}
