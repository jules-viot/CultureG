//
//  QuestionCollection.swift
//  CultureG
//
//  Created by Jules Viot on 22/09/2019.
//  Copyright © 2019 Jules Viot. All rights reserved.
//

import Foundation

class QuestionCollection {
    func all() -> [Question] {
        var Questions = [Question]()
        
        Questions = [
            Question(question: "En quelle année Charlemagne se fait-il sacrer empereur ?",
                     answers: ["756 ap. J.-C","800 ap. J.-C","787 ap. J.-C","843 ap. J.-C"],
                     answer: 1,
                     valeur: 30),
            Question(question: "À quel célèbre écrivain et philosophe doit-on le Contrat social et La nouvelle Héloïse ?",
                     answers: ["D'Alembert","Mirabeau","Rousseau","Chateaubriand"],
                     answer: 2,
                     valeur: 30),
            Question(question: "De quelle ville française le cannelé est-il une spécialité ?",
                     answers: ["Toulouse","Marseille","Nantes","Bordeaux"],
                     answer: 3,
                     valeur: 15),
            Question(question: "Quelle est la capitale de l’Inde ?",
                     answers: ["Calcutta","Mumbai","New Delhi","Bangalore"],
                     answer: 2,
                     valeur: 25)]
        
        return Questions
    }
}
