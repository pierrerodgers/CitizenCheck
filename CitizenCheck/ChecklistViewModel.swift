//
//  ChecklistViewModel.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 29/11/20.
//
import Foundation
import SwiftUI
import Combine

class ChecklistViewModel : ObservableObject {
    @Published var uncompletedDocuments : [Document]
    @Published var completedDocuments : [Document]
    
    @ObservedObject private var appData : AppData
    
    private var bag : Set<AnyCancellable> = Set()
    
    func completeDocument(_ documentId:Int) {
        let idx = uncompletedDocuments.firstIndex { $0.id == documentId }!
        var document = uncompletedDocuments[idx]
        document.completed = true
        uncompletedDocuments.remove(at:idx)
        completedDocuments.append(document)
    }
    
    func uncompleteDocument(_ documentId:Int) {
        let idx = completedDocuments.firstIndex { $0.id == documentId }!
        var document = completedDocuments[idx]
        document.completed = false
        completedDocuments.remove(at:idx)
        uncompletedDocuments.append(document)
    }
    
    init(appData: AppData) {
        self.appData = appData
        
        self.uncompletedDocuments = appData.uncompletedDocuments
        self.completedDocuments = appData.completedDocuments
        
        appData.$completedDocuments.sink(receiveValue: { documents in
            self.completedDocuments = documents
        }).store(in: &bag)
        
        appData.$uncompletedDocuments.sink(receiveValue: { documents in
            self.uncompletedDocuments = documents
        }).store(in: &bag)
    }
}
