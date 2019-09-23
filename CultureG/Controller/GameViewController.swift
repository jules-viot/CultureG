//
//  GameViewController.swift
//  CultureG
//
//  Created by Jules Viot on 21/09/2019.
//  Copyright © 2019 Jules Viot. All rights reserved.
//

import UIKit
import CoreData

class GameViewController: UIViewController {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet var repButtons: [RoundButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let layer = CAGradientLayer()
    var Questions = [Question]()
    var qNumber = Int()
    var answerNumber = Int()
    var score = 0
    
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Met en place le dégrader du background
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
        
        //Récupère le score sauvegarder
        score = UserDefaults.standard.integer(forKey: "score")
        scoreLabel.text = "\(score)"
        
        if Questions.count > 0 {
            qNumber = Int(arc4random_uniform(UInt32(Questions.count)))
            qLabel.text = Questions[qNumber].question
            
            //Récupération du numéro de la réponse juste
            answerNumber = Questions[qNumber].answer
            
            //mise en place des différentes réponses sur les quatres boutons
            for i in 0..<repButtons.count {
                repButtons[i].setTitle(Questions[qNumber].answers[i], for: UIControl.State.normal)
            }
            
        } else {
            NSLog("Done!")
        }
    }
    
    // Remet le fond des boutons en transparant
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
            score = score + Questions[qNumber].valeur
            repButtons[0].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            score = score - (50 - Questions[qNumber].valeur)
            repButtons[0].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 4)
        }
    }
    @IBAction func btn2(_ sender: Any) {
        //Si la réponse choisi correspond
        if answerNumber == 1 {
            score = score + Questions[qNumber].valeur
            repButtons[1].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            score = score - (50 - Questions[qNumber].valeur)
            repButtons[1].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 4)
        }
    }
    @IBAction func btn3(_ sender: Any) {
        //Si la réponse choisi correspond
        if answerNumber == 2 {
            score = score + Questions[qNumber].valeur
            repButtons[2].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            score = score - (50 - Questions[qNumber].valeur)
            repButtons[2].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 4)
        }
    }
    @IBAction func btn4(_ sender: Any) {
        //Si la réponse choisi correspond
        if answerNumber == 3 {
            score = score + Questions[qNumber].valeur
            repButtons[3].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 2)
        } else {
            NSLog("Wrong!")
            score = score - (50 - Questions[qNumber].valeur)
            repButtons[3].backgroundColor = .red
            repButtons[answerNumber].backgroundColor = .green
            perform(#selector(saveScore), with: nil, afterDelay: 4)
        }
    }
    
    
    
    //fonction qui sauvegarde le score
    @objc func saveScore() {
        //Retire la question posé de la liste
        Questions.remove(at: qNumber)
        //Sauvegarde le score
        UserDefaults.standard.set(score, forKey: "score")
        pickQuestion()
    }
    
    
    
}
