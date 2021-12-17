//
//  HomeViewController.swift
//  Quiz
//
//  Created by Marcylene Barreto on 05/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let question1 = QuestionModel(title: "De onde é a invenção do chuveiro elétrico?", answer: [AnswerModel(name: "França", style: .blank),
                    AnswerModel(name: "Inglaterra", style: .blank),
                    AnswerModel(name: "Austrália", style: .blank),
                    AnswerModel(name: "Brasil", style: .blank)
        ], answerCorrect: 2)
    
    let question2 = QuestionModel(title: "De quem é a famosa frase “Penso, logo existo”?", answer: [AnswerModel(name: "Platão", style: .blank),
                    AnswerModel(name: "Galileu Galilei", style: .blank),
                    AnswerModel(name: "Descartes", style: .blank),
                    AnswerModel(name: "Socrates", style: .blank)
        ], answerCorrect: 2)
    
    let question3 = QuestionModel(title: "Quais o menor e o maior país do mundo?", answer: [AnswerModel(name: "Vaticano e Rússia", style: .blank),
                    AnswerModel(name: "Nauru e China", style: .blank),
                    AnswerModel(name: "Mônaco e Canadá", style: .blank),
                    AnswerModel(name: "São Marino e Índia", style: .blank)
        ], answerCorrect: 0)
    
    let question4 = QuestionModel(title: "Qual o livro mais vendido no mundo a seguir à Bíblia?", answer: [AnswerModel(name: "O Senhor dos Anéis", style: .blank),
                    AnswerModel(name: "Dom Quixote", style: .blank),
                    AnswerModel(name: "O Pequeno Príncipe", style: .blank),
                    AnswerModel(name: "Ela, a Feiticeira", style: .blank)
        ], answerCorrect: 1)
    
    let question5 = QuestionModel(title: "Quantas casas decimais tem o número pi?", answer: [AnswerModel(name: "Duas", style: .blank),
                    AnswerModel(name: "Centenas", style: .blank),
                    AnswerModel(name: "Infinitas", style: .blank),
                    AnswerModel(name: "Milhares", style: .blank)
        ], answerCorrect: 2)
    
    lazy var questions: [QuestionModel] = [
        question1,
        question2,
        question3,
        question4,
        question5
    ]

    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var backgroudView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }

    @IBAction func handlerButtonStart(_ sender: Any) {
        let viewController = QuestionViewController(questions: questions)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupUI() {
            navigationController?.navigationBar.barTintColor = UIColor(red: 21/255, green: 59/255, blue: 77/255, alpha: 1)
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        title = "Perguntas e Respostas"
        
        backgroudView.layer.cornerRadius = 30
        buttonStart.layer.cornerRadius = 25
    
        
    }
    
}
