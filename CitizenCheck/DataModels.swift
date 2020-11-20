//
//  DataModels.swift
//  CitizenCheck
//
//  Created by Pierre Rodgers on 18/11/20.
//

import Foundation


struct EligibilityQuestion {
    let question : String
    let options : [String]
    var response : String?
    
    var id : Int = 0
    
}
