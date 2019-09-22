//
//  GameViewController.swift
//  CultureG
//
//  Created by Jules Viot on 21/09/2019.
//  Copyright © 2019 Jules Viot. All rights reserved.
//

import UIKit

struct Question {
    var question: String
    var answers: [String]
    var answer: Int!
    var valeur: Int!
}

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
        
        Questions = [Question(question: "En quelle année Charlemagne se fait-il sacrer empereur ?", answers: ["756 ap. J.-C","800 ap. J.-C","787 ap. J.-C","843 ap. J.-C"], answer: 1, valeur: 30), Question(question: "À quel célèbre écrivain et philosophe doit-on le Contrat social et La nouvelle Héloïse ?", answers: ["D'Alembert","Mirabeau","Rousseau","Chateaubriand"], answer: 2, valeur: 30)]
        
        pickQuestion()
    }
    
    //Mettre la barre de statut en blanc
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupLayer(){
        layer.frame = view.bounds
        layer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        layer.startPoint = CGPoint(x:0,y:0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(layer, at: 0)
    }
    
    // Fonction qui choisi une question puis l'enlève
    func pickQuestion(){
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

    //Bouton retour
    @IBAction func returnBouton(_ sender: Any) {
        performSegue(withIdentifier: "menuSegue", sender: nil)
    }
    
    //Les 4 boutons réponse
    @IBAction func btn1(_ sender: Any) {
        if answerNumber == 0 {
            pickQuestion()
        } else {
            NSLog("Wrong!")
        }
    }
    @IBAction func btn2(_ sender: Any) {
        if answerNumber == 1 {
            pickQuestion()
        } else {
            NSLog("Wrong!")
        }
    }
    @IBAction func btn3(_ sender: Any) {
        if answerNumber == 2 {
            pickQuestion()
        } else {
            NSLog("Wrong!")
        }
    }
    @IBAction func btn4(_ sender: Any) {
        if answerNumber == 3 {
            pickQuestion()
        } else {
            NSLog("Wrong!")
        }
    }
    
    
}
