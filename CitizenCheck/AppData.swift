//
//  AppData.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 30/11/20.
//

import Foundation
import SwiftUI

class AppData : ObservableObject {

    // Holds the state of the app overall
    // i.e. is the user still filling the eligibility questions, or the checklist questions, or are they up to the checklist
    enum AppState : Int {
        case eligibility = 0, checklistQuestions = 1, checklist = 2
    }

    @Published var state : AppState

    // The list of all eligiblity questions
    var eligibilityQuestions : [EligibilityQuestion]

    // The list of all checklist questions
    var checklistQuestions : [EligibilityQuestion]


    // The dict of all the potential documents (stored by ID)
    var documents : Dictionary<Int, Document>

    // The dict of the documents required by the user (stored by ID)
    var requiredDocuments : Dictionary<Int, Document>
    
    // For checklist doc logic -- maps a checklist question to a list of doc IDs
    var questionToDoc = Dictionary<Int, [Int]>()

    // The list of uncompleted documents
    @Published var uncompletedDocuments : [Document]
    
    // The list of completed documents
    @Published var completedDocuments : [Document]

    init() {

        // Initialise the eligibility questions
        let question0 = EligibilityQuestion(question: "Are you at least 18 years old?", options: ["Yes","No"], id:0)
        let question1 = EligibilityQuestion(question: "Are you a lawful permanent resident (green card holder)?", options: ["Yes", "No"], id:1)
        let question2 = EligibilityQuestion(question: "How long have you been a lawful permanent resident?", options: ["Under five years", "Five years or more"], id:2)
        let question3 = EligibilityQuestion(question: "Do any of these apply: ", options:["Yes", "No"], id:3)
        let question4 = EligibilityQuestion(question: "Have you had a continuous residence in the U.S. for at least the past 5 years?", options:["Yes", "No"], id:4)
        let question5 = EligibilityQuestion(question: "Have you been physically present in the U.S. for at least 30 months of the past 5 years?", options:["Yes", "No"], id:5)
        let question6 = EligibilityQuestion(question: "Are you a male between the ages of 18-25?", options:["Yes", "No"], id:6)

        self.eligibilityQuestions = [question0, question1, question2, question3, question4, question5, question6]


        // TO COMPLETE: Initialise the checklist questions (from Google Doc)
        let checklistQuestion0 = EligibilityQuestion(question: "Do you live outside of the US?", options: ["Yes","No"], id:0)
        let checklistQuestion1 = EligibilityQuestion(question: "Is an attorney acting for you?", options: ["Yes", "No"], id:1)
        let checklistQuestion2 = EligibilityQuestion(question: "Is your legal name different from the name on your Permanent Resident Card?", options: ["Yes", "No"], id:2)
        let checklistQuestion3 = EligibilityQuestion(question: "Were you married before?", options:["Yes", "No"], id:3)
        let checklistQuestion4 = EligibilityQuestion(question: "Have you taken any trip outside of the US longer than 6 months since becoming a permanent resident?", options:["Yes", "No"], id:4)
        let checklistQuestion5 = EligibilityQuestion(question: "Do you have a dependent spouse or kid(s) who do not live with you?", options:["Yes", "No"], id:5)
        let checklistQuestion6 = EligibilityQuestion(question: "Are you applying for an exception to the testing requirement based on a disability?", options:["Yes", "No"], id:6)
        let checklistQuestion7 = EligibilityQuestion(question: "Are you 1) male, 2) older than 26 and 3) did not register with the Selective Service while living in the US between ages of 18 and 26?", options:["Yes", "No"], id:7)
        let checklistQuestion8 = EligibilityQuestion(question: "Have you ever failed to file income taxes since becoming a Permanent Resident?", options:["Yes", "No"], id:8)
        // If yes, continue. If no, skip to 10
        
        
        let checklistQuestion9 = EligibilityQuestion(question: "Do you have any overdue taxes (federal, state or local)", options:["Yes", "No"], id:9)
        let checklistQuestion10 = EligibilityQuestion(question: "Have you ever been arrested or detained by law enforcement?", options:["Yes", "No"], id:10)
        // If yes, continue. If no, skip to 15
        
        let checklistQuestion11 = EligibilityQuestion(question: "Have you ever been arrested or detained by law enforcement without charges being filed? ", options: ["Yes", "No"], id:11)
        let checklistQuestion12 = EligibilityQuestion(question: "Have you ever been arrested or detained by law enforcement and had charges filed?", options: ["Yes", "No"], id:12)
        let checklistQuestion13 = EligibilityQuestion(question: "Have you ever been convicted or placed in an alternative sentencing or rehab program (such as community service or drug treatment)?", options: ["Yes", "No"], id:13)
        let checklistQuestion14 = EligibilityQuestion(question: "Have you ever had any arrest or conviction vacated or removed from your record?", options: ["Yes", "No"], id:14)
        let checklistQuestion15 = EligibilityQuestion(question: "Are you applying on the basis of marriage to a US citizen?", options:["Yes", "No"], id:15)
        let checklistQuestion16 = EligibilityQuestion(question: "Are you seeking citizenship on the basis of US military service?", options:["Yes", "No"], id:16)
        
        
        self.checklistQuestions = [checklistQuestion0, checklistQuestion1, checklistQuestion2, checklistQuestion3, checklistQuestion4, checklistQuestion5, checklistQuestion6, checklistQuestion7, checklistQuestion8, checklistQuestion9, checklistQuestion10, checklistQuestion11, checklistQuestion12, checklistQuestion13, checklistQuestion14, checklistQuestion15, checklistQuestion16]
        

        self.documents = Dictionary<Int, Document>()
        
        documents[0] = Document(title: "A check or money order for the application fee & biometric services fee", description: "See N-400 form for more info and details: https://www.uscis.gov/n-400. Write your A-Number (listed on your Permanent Resident Card) on the back of the check or money order.", completed: false, id: 0)
        documents[1] = Document(title: "A photocopy of both sides of your Permanent Resident Card (aka Green Card). ", description: "If you have lost the card, submit a photocopy of the receipt of your Form I-90 (Application to Replace Permanent Resident Card)", completed: false, id: 1)
        documents[22] = Document(title: "Two identical color photographs with your name and A-Number written lightly in pencil on the back of each photo.", description: "See Part 5 of Form M-476 (A Guide to Naturalization) and Form N-400 (Application for Naturalization) for more details about photo requirements.", completed: false, id: 22)
        documents[23] = Document(title: "Complete G-28 Form (Notice of Entry of Appearance as Attorney or Accredited Representative: https://www.uscis.gov/g-28)", description: "See https://www.uscis.gov/g-28 for more information", completed: false, id: 23)
        documents[2] = Document(title: "Document(s) that show you legally changed your name including marriage certificate, court document, etc.", description: "", completed: false, id: 2)
        documents[3] = Document(title: "Proof that your earlier marriages ended (divorce decrees, annulments, or death certificates)", description: "This can be divorce decrees, annulments, or death certificates", completed: false, id: 3)
        documents[4] = Document(title: "Evidence that you and your family still lived, worked or kept ties to the US", description: "This can be an IRS tax return listing information for the last 5 years", completed: false, id: 4)
        documents[5] = Document(title: "Any court order or government order related to financial support", description: "", completed: false, id:5) //5 & 6 ALWAYS GO TOGETHER
        documents[6] = Document(title: "Evidence of your financial support showing you have followed any court or government order", description: """
            Evidence can be:
            Cancelled checks
            Money and receipts
            A court or agency printout of child support payments
            Evidence of wage garnishments
            A letter from the parent or guardian who cares for your kid(s)
            """, completed: false, id:6) //5 & 6 ALWAYS GO TOGETHER
        documents[7] = Document(title: "An original N-648 Form (Medical Certification for Disability Exceptions: https://www.uscis.gov/n-648) completed less than 6 months ago by a licensed doctor or clinical psychologist", description: "See https://www.uscis.gov/n-648 for more details", completed: false, id: 7)
        documents[8] = Document(title: "A “Status Information Letter” from Selective Service", description: "Call Selective Service at 1-847-688-6888 for information on how to obtain your status letter.", completed: false, id: 8)
        documents[9] = Document(title: "All communication with the IRS regarding failure to file", description: "", completed: false, id: 9)
        documents[10] = Document(title: "A signed agreement from the IRS or other tax office showing you have filed a tax return and arranged to pay taxes you owe", description: "You can get copies of tax documents and info by contacting local IRS offices, using the Blue Pages of your telephone directory, or at www.irs.gov", completed: false, id: 10) //10 & 11 ALWAYS GO TOGETHER
        documents[11] = Document(title: "Documentation from the IRS or other tax office showing the status of your repayment", description: "You can get copies of tax documents and info by contacting local IRS offices, using the Blue Pages of your telephone directory, or at www.irs.gov", completed: false, id: 11) //10 & 11 ALWAYS GO TOGETHER
        documents[12] = Document(title: "An original official statement by arresting agency confirming no charges were filed", description: "", completed: false, id: 12)
        documents[13] = Document(title: "An original or court-certified copy of the arrest record and record of settlement", description: "This can be a dismissal order, conviction record, or acquittal order", completed: false, id: 13)
        documents[14] = Document(title: "An original or court-certified copy of the sentencing record for each incident", description: "", completed: false, id: 14) //14 & 15 ALWAYS GO TOGETHER
        documents[15] = Document(title: "Evidence you completed your sentence", description: """
            Evidence can be:
            An original or certified copy of your probation or parole record
            Evidence that you completed an alternative sentencing program or rehab program
            """, completed: false, id: 15) //14 & 15 ALWAYS GO TOGETHER
        documents[16] = Document(title: "Include EITHER an original or court-certified copy of the court order removing the arrest or conviction OR Include an original statement from the court that no record exists of your arrest/conviction", description: "You may include any evidence in your favor concerning the circumstances of your arrest/conviction if you would like it to be considered in your application", completed: false, id: 16)
        documents[17] = Document(title: """
            Include:
            Evidence your spouse has been a US citizen for the last 3 years, which could be:
            1. Birth certificate
            OR 2. Certificate of naturalization
            OR 3. Certificate of citizenship
            OR 4. Inside of front cover and signature of spouse’s current US passport
            OR 5. FS-240 form (Report of Birth Abroad of a Citizen of the US)
            """, description: "", completed: false, id: 17) //17, 18, 19, 20 ALWAYS GO TOGETHER
        documents[18] = Document(title: "Proof of marriage certificate", description: "", completed: false, id: 18) //17, 18, 19, 20 ALWAYS GO TOGETHER
        documents[19] = Document(title: "Proof of ending of former marriages (death certificates or divorce decrees)", description: "This can be death certificates or divorce decrees", completed: false, id: 19) //17, 18, 19, 20 ALWAYS GO TOGETHER
        documents[20] = Document(title: "Documents referring to you and your spouse", description: """
            This can be
            Tax returns, bank accounts, leases, mortgages, or birth certificates of children
            OR IRS-certified copies of income tax forms you filed with your spouse for the past 3 years
            OR An IRS tax return transcript for last 3 years
            """, completed: false, id: 20) //17, 18, 19, 20 ALWAYS GO TOGETHER
        documents[21] = Document (title: "A N-426 Form (Request for Certification of Military or Naval Service", description: "", completed: false, id: 21)
        
        
        
        questionToDoc[0] = [22]
        questionToDoc[1] = [23]
        questionToDoc[2] = [2]
        questionToDoc[3] = [3]
        questionToDoc[4] = [4]
        questionToDoc[5] = [5, 6]
        questionToDoc[6] = [7]
        questionToDoc[7] = [8]
        questionToDoc[8] = [9]
        questionToDoc[9] = [10, 11]
        questionToDoc[10] = []
        questionToDoc[11] = [12]
        questionToDoc[12] = [13]
        questionToDoc[13] = [14, 15]
        questionToDoc[14] = [16]
        questionToDoc[15] = [17, 18, 19, 20]
        questionToDoc[16] = [21]
        


        
        
        // App State
        let stateValue = UserDefaults.standard.value(forKey: "appState") as? Int ?? 0
        self.state = AppState(rawValue: stateValue) ?? .eligibility
        
        // Fill required documents
        self.requiredDocuments = Dictionary<Int, Document>()
        let requiredDocsIndexes = (UserDefaults.standard.array(forKey: "requiredDocuments") ?? []) as? [Int] ?? []
        for index in requiredDocsIndexes {
            requiredDocuments[index] = documents[index]
        }
        
        // Fill completed documents
        var completedDocs = [Document]()
        let completedDocsIndexes = (UserDefaults.standard.array(forKey: "documents") ?? []) as? [Int] ?? []
        for index in completedDocsIndexes {
            var completedDoc = documents[index]!
            completedDoc.completed = true
            completedDocs.append(completedDoc)
        }
        self.completedDocuments = completedDocs
        
        // Fill uncompleted documents
        let uncompleted = Array(requiredDocuments.filter { !completedDocsIndexes.contains($0.key) }.values)
        self.uncompletedDocuments = uncompleted

        

    }
    
    func saveState(_ state: AppState) {
        UserDefaults.standard.setValue(state.rawValue, forKey: "appState")
    }

    func saveEligbility(_ isEligible:Bool) {
        // TO COMPLETE: Use UserDefaults to save whether or not the user is eligible for citizenship or not

        UserDefaults.standard.set(isEligible, forKey: "isEligible")
    }

    func saveRequiredDocuments(_ documentIds:[Int]) {
       // TO COMPLETE: Use UserDefaults to save a list of the ids of the required documents based on the
        // checklist question answers
        UserDefaults.standard.set(documentIds, forKey: "requiredDocuments")
        
        for index in documentIds {
            self.uncompletedDocuments.append(self.documents[index]!)
        }
    }

    
    func completeDocument(_ document: Document) {
        // TO COMPLETE: Use UserDefaults to keep track of completed documents

        // I think we should just keep track of the IDs of the completed and incomplete documents
        if let completeDocumentIds = (UserDefaults.standard.array(forKey: "documents")
                                        as? [Int]) {
            var documentIds = completeDocumentIds
            documentIds.append(document.id)
            UserDefaults.standard.set(documentIds, forKey:"documents")
        } else { // no data stored for key "completeDocuments" in UserDefaults
            var documentIds = [Int]()
            documentIds.append(document.id)
            UserDefaults.standard.set(documentIds, forKey:"documents")
        }
    }

    func uncompleteDocument(_ document: Document) {
        // TO COMPLETE: Use UserDefaults to keep track of completed documents

        // I think we should just keep track of the IDs of the completed and incomplete documents
        if let completeDocumentIds = (UserDefaults.standard.array(forKey: "documents")
                                        as? [Int]) {
            var documentIds = completeDocumentIds
            if let index = documentIds.firstIndex(where: {$0 == document.id}) {
              documentIds.remove(at: index)
            }
            UserDefaults.standard.set(documentIds, forKey:"documents")
        } else { // no data stored for key "completeDocuments" in UserDefaults
            // do nothing
        }

    }
}
