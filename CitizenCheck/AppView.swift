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
            EligibilityView(model: EligibilityViewModel(appData: appData))
        case .checklistQuestions:
            ChecklistQuestionsView(model: ChecklistQuestionsViewModel(appData: appData))
        case .checklist:
            ChecklistView(model: ChecklistViewModel(appData: appData))
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
