//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Kourtnie Jenkins on 3/25/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


struct TrueFalseQuestion {
    let question: String
    let answer: Bool
    
    init(question: String, answer: Bool){
        self.question = question
        self.answer = answer
    }
}
