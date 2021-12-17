//
//  AnswerModel.swift
//  Quiz
//
//  Created by Marcylene Barreto on 14/12/21.
//

import Foundation

struct AnswerModel {
    enum Style {
        case blank
        case selected
        case correct
        case incorrect
    }
    
    let name: String
    var style: Style
}
