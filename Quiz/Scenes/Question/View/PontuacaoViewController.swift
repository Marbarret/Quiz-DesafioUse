//
//  PontuacaoViewController.swift
//  Quiz
//
//  Created by Marcylene Barreto on 16/12/21.
//

import UIKit

class PontuacaoViewController: UIViewController {
    
    let countCorrect: Int
    let total: Int

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var labelCountAnswer: UILabel!
    
    init(countCorrect: Int, total: Int) {
        self.countCorrect = countCorrect
        self.total = total
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    @IBAction func heandlerButtonRestart(_ sender: Any) {
        //voltar para tela inicial
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        title = "Pontuacao Final"
        
        labelCountAnswer.text = "\(countCorrect)/\(total) Acertos"
        viewContent.layer.cornerRadius = 30
    }
    
}
