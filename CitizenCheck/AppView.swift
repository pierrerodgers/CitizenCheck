//
//  AppView.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 3/12/20.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var appData : AppData
    
    var body: some View {
        switch appData.state {
        case .eligibility:
            EligibilityView(model: EligibilityViewModel())
        case .checklistQuestions:
            ChecklistQuestionsView(model: ChecklistQuestionsViewModel())
        case .checklist:
            ChecklistView(model: ChecklistViewModel())
        }
    }
}
/*
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
*/
