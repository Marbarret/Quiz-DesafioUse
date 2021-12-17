//
//  QuestionModel.swift
//  Quiz
//
//  Created by Marcylene Barreto on 07/11/21.
//

import Foundation

struct QuestionModel {
    let title: String
    var answer: [AnswerModel]
    let answerCorrect: Int
    var isAnswer: Bool = false
}

