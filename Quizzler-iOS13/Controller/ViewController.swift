//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var quizProgressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
//    private let quiz: [TrueFalseQuestion] = [
//        TrueFalseQuestion(question: "Four + Two is equal to Six", answer: true),
//        TrueFalseQuestion(question: "Five - Three is greater than One", answer: true),
//        TrueFalseQuestion(question: "Three + Eight is less than Ten", answer: false)
//    ]
    
    private var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = quiz.startQuiz()
        
        questionLabel.text = firstQuestion.question
        quizProgressBar.progress = 0.0
        updateScore()
        
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        if let answerButtonTitle = sender.currentTitle {
            if let userAnswer = Bool(answerButtonTitle.lowercased()){
                
                let isAnswerCorrect = quiz.checkUserAnswer(currentQuestionIndex: quiz.questionIndex , answer: userAnswer)
                
                displayResult(result: isAnswerCorrect, buttonSelection: sender)
                getNextQuestion()
                
            }
        } else { return }
        
    }
    
    
    
    private func displayResult(result: Bool, buttonSelection: UIButton){
        if (result){
            buttonSelection.backgroundColor = UIColor.green
        } else {
            buttonSelection.backgroundColor = UIColor.red
        }
    }
    
    private func getNextQuestion(){
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc private func updateUI(){
        updateQuizProgressBar()
        updateQuestion()
        resetTrueFalseButtonColors()
        updateScore()
    }
    
    private func updateScore(){
        scoreLabel.text = "Score: \(quiz.score)"
    }
    
    private func updateQuestion(){
        let nextQuestion = quiz.getNextQuestion()
        questionLabel.text = nextQuestion.question
    }
    
    func resetTrueFalseButtonColors() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func updateQuizProgressBar(){
        quizProgressBar.progress = quiz.progress
    }

    
}

