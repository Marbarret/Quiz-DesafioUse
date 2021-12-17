//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Marcylene Barreto on 05/11/21.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var questions: [QuestionModel]
    var indexQuestion: Int = 0
    var countCorrectAnswer = 0
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    init(questions: [QuestionModel]) {
        self.questions = questions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func handlerButtonAnswer(_ sender: Any) {
        // button Next Question
        if questions[indexQuestion].isAnswer {
            
            indexQuestion += 1
            if indexQuestion < questions.count {
                updateLayout()
            }
            else {
                let viewController = PontuacaoViewController(countCorrect: countCorrectAnswer, total: questions.count)
                navigationController?.pushViewController(viewController, animated: true)
            }
            buttonNext.setTitle("Responder", for: .normal)
            
        } else {
            // Clicando em responder
            for indexAnswer in 0..<questions[indexQuestion].answer.count {
                if indexAnswer == questions[indexQuestion].answerCorrect {
                    if questions[indexQuestion].answer[indexAnswer].style == .selected {
                        countCorrectAnswer += 1
                    }
                    questions[indexQuestion].answer[indexAnswer].style = .correct
                }
                else if questions[indexQuestion].answer[indexAnswer].style == .selected {
                    questions[indexQuestion].answer[indexAnswer].style = .incorrect
                }
            }
        }
        tableView.reloadData()
        
        questions[indexQuestion].isAnswer = true
        buttonNext.setTitle("Próxima Pergunta", for: .normal)
    }
    
    func updateLayout() {
        labelQuestion.text = questions[indexQuestion].title
        tableView.reloadData()
    }
    
    func setupUI() {
        title = "Perguntas e Respostas"
        labelQuestion.text = questions[indexQuestion].title
        
        tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        buttonNext.layer.cornerRadius = 25
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[indexQuestion].answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let answer = questions[indexQuestion].answer[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as? AnswerCell {
            cell.setup(model: answer)
//            cell.configureCell(content: UITableViewCell[indexPath.row])

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if questions[indexQuestion].isAnswer {
            return
        }
        
        for indexAnswer in 0..<questions[indexQuestion].answer.count {
            questions[indexQuestion].answer[indexAnswer].style = indexAnswer == indexPath.row ? .selected : .blank
        }
        tableView.reloadData()
        
    }

}


