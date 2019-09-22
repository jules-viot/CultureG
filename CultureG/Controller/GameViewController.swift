//
//  GameViewController.swift
//  CultureG
//
//  Created by Jules Viot on 21/09/2019.
//  Copyright © 2019 Jules Viot. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet var repButtons: [RoundButton]!
    
    let layer = CAGradientLayer()
    var Questions = [Question]()
    var qNumber = Int()
    var answerNumber = Int()
    var score = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        
        //Récupère toutes les questions et les réponses de la collection
        Questions = QuestionCollection().all()
        
        //Lance la première question
        pickQuestion()
    }
    
    //Mettre la barre de statut en blanc
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Met en place le dégrader de fond
    func setupLayer(){
        layer.frame = view.bounds
        layer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        layer.startPoint = CGPoint(x:0,y:0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(layer, at: 0)
    }
    
    // Fonction qui choisi une question puis l'enlève
    @objc func pickQuestion(){
        buttonBackgroundSetup()
        if Questions.count > 0 {
            qNumber = Int(arc4random_uniform(UInt32(Questions.count)))
            qLabel.text = Questions[qNumber].question
            
            //Récupération du numéro de la réponse juste
            answerNumber = Questions[qNumber].answer
            
            //mise en place des différentes réponses sur les quatres boutons
            for i in 0..<repButtons.count {
                repButtons[i].setTitle(Questions[qNumber].answers[i], for: UIControl.State.normal)
            }
            //retire de la liste la question
            Questions.remove(at: qNumber)
            
        } else {
            NSLog("Done!")
        }
    }
    
    // Remet
    func buttonBackgroundSetup() {
        for i in 0..<repButtons.count {
            repButtons[i].backgroundColor = nil
        }
    }
    

    //Bouton retour
    @IBAction func returnBouton(_ sender: Any) {
        performSegue(withIdentifier: "menuSegue", sender: nil)
    }
    
    //Les 4 boutons réponse
    @IBAction func btn1(_ sender: Any) {
        //Si la réponse choisi correspond
        if answerNumber == 0 {
            repButtons[0].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            repButtons[0].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 4)
        }
    }
    @IBAction func btn2(_ sender: Any) {
        //Si la réponse choisi correspond
        if answerNumber == 1 {
            repButtons[1].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            repButtons[1].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 4)
        }
    }
    @IBAction func btn3(_ sender: Any) {
        //Si la réponse choisi correspond
        if answerNumber == 2 {
            repButtons[2].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            repButtons[2].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 4)
        }
    }
    @IBAction func btn4(_ sender: Any) {
        //Si la réponse choisi correspond
        if answerNumber == 3 {
            repButtons[3].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            repButtons[3].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(pickQuestion), with: nil, afterDelay: 4)
        }
    }
    
    
}
