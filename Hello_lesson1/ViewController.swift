//
//  ViewController.swift
//  Hello_lesson1
//
//  Created by Smagul Negmatov on 05.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        winnerButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBOutlet var labelWinner: UILabel!
    @IBOutlet var winnerButton: UIButton!
    var game = TicTacToe()
    @IBOutlet var arrayButtons: [UIButton]!
    
    @IBAction func buttonClick(_ sender: UIButton) {
        let index = arrayButtons.firstIndex(of: sender)!
        game.writeXO(at: index)
        updateView()
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 7) {
            sender.titleLabel?.bounds = CGRect(x: Int(sender.bounds.origin.x) - 10, y: Int(sender.bounds.origin.y)+10, width: Int(sender.bounds.width), height: 0)
            sender.backgroundColor = .red
        }
        
       
    }
    @IBAction func restart(_ sender: UIButton) {
        game.restart()
        updateView()
        labelWinner.text = ""
    }
    func updateView() {
        for i in arrayButtons.indices {
            let button = arrayButtons[i]
            let card = game.XOs[i]
            if card.isFaceUp{
                button.setTitle(card.label, for: .normal)
                button.isEnabled = false
            }
            else {
                button.setTitle("", for: .normal)
                button.isEnabled = true
            }
        }
        if let winner = game.winGame() {
            labelWinner.text = "Winner :\(winner)"
            for i in arrayButtons {
                i.isEnabled = false
            }
            if winner != "Draw" {
                winnerButton.isHidden = false
            }
        }
            
    }
    
}

