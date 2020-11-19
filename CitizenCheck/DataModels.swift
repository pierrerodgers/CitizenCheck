//
//  DataModels.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 18/11/20.
//

import Foundation


struct EligibilityQuestion {
    let question : String = "Are you at least 18 years old?"
    let options : [String] = ["Yes", "No"]
    var response : String?
    
    var id : String = "0"
    
}
