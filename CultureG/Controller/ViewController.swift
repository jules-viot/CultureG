//
//  ViewController.swift
//  CultureG
//
//  Created by Jules Viot on 20/09/2019.
//  Copyright © 2019 Jules Viot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    let layer = CAGradientLayer()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayer()
    }
    
    @IBAction func playButton(_ sender: Any) {
        performSegue(withIdentifier: "playSegue", sender: nil)
    }
    
    func setupLayer(){
        layer.frame = view.bounds
        layer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        layer.startPoint = CGPoint(x:0,y:0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(layer, at: 0)
    }
    
}

