//
//  Quiz.swift
//  Quizzler-iOS13
//
//  Created by Kourtnie Jenkins on 3/25/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Quiz {
    private let questionList: [TrueFalseQuestion] = [
        TrueFalseQuestion(question: "Four + Two is equal to Six", answer: true),
        TrueFalseQuestion(question: "Five - Three is greater than One", answer: true),
        TrueFalseQuestion(question: "Three + Eight is less than Ten", answer: false)
    ]
    
    public var questionIndex = 0
    public var progress: Float {
        get {
            return Float(questionIndex + 1) / Float(questionList.count)
        }
    }
    public var score = 0
    
    
    public func startQuiz() -> TrueFalseQuestion{
        return questionList[questionIndex]
    }
    
    public mutating func checkUserAnswer(currentQuestionIndex: Int, answer: Bool) -> Bool{
        
        let correctAnswer = questionList[currentQuestionIndex].answer
        
        if(answer == correctAnswer){
            score += 1
            return true
        }
        
        return false
    }
    
    public mutating func getNextQuestion() -> TrueFalseQuestion {
        questionIndex += 1
        
        
        if(questionIndex > questionList.count - 1){
            questionIndex = 0
            score = 0
        }
        
        return questionList[questionIndex]
        
    }
    
    
}
