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
                     valeur: 30,
                     categorie:"Histoire"),
            Question(question: "À quel célèbre écrivain et philosophe doit-on le Contrat social et La nouvelle Héloïse ?",
                     answers: ["D'Alembert","Mirabeau","Rousseau","Chateaubriand"],
                     answer: 2,
                     valeur: 30,
                     categorie:"Histoire"),
            Question(question: "De quelle ville française le cannelé est-il une spécialité ?",
                     answers: ["Toulouse","Marseille","Nantes","Bordeaux"],
                     answer: 3,
                     valeur: 15,
                     categorie:"Cuisine"),
            Question(question: "Quelle est la capitale de l’Inde ?",
                     answers: ["Calcutta","Mumbai","New Delhi","Bangalore"],
                     answer: 2,
                     valeur: 25,
                     categorie:"Géographie"),
            Question(question: "Quel est le nom du principal indice boursier de la place de Paris ?",
                     answers: ["Le CAC 40","Le Dax","Le Nifty","Le Footsie"],
                     answer: 0,
                     valeur: 15,
                     categorie:"Economie"),
            Question(question: "Quelle est la capitale de la Suède ?",
                     answers: ["Oslo","Coppenhage","Helsinki","Stockolm"],
                     answer: 3,
                     valeur: 25,
                     categorie:"Géographie"),
            Question(question: "Quel pays a interdit la construction de minaret après un referendum en 2009 ?",
                     answers: ["La Suisse","La France","Le Royaum-Uni","La Belgique"],
                     answer: 0,
                     valeur: 30,
                     categorie:"Géographie"),
            Question(question: "Dans quel roman de Victor Hugo trouve-t-on le personnage de Quasimodo ?",
                     answers: ["L'Homme qui rit","Notre-Dame-De-Paris","Les Misérables","Quatrevingt-treiz"],
                     answer: 1,
                     valeur: 25,
                     categorie:"Litérature")]
        
        return Questions
    }
}
