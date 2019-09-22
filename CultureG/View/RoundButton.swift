//
//  RoundButton.swift
//  CultureG
//
//  Created by Jules Viot on 20/09/2019.
//  Copyright © 2019 Jules Viot. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 20
        layer.borderWidth = 5
        layer.borderColor = UIColor.white.cgColor
        setTitleColor(.white, for: .normal)
        
        
    }
    
}

