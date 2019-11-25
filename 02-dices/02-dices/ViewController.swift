//
//  ViewController.swift
//  02-dices
//
//  Created by Carlos Garcia on 5/3/19.
//  Copyright © 2019 Carlos Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    var randomDiceIndexLeft : Int = 0
    var randomDiceIndexRight : Int = 0
    let diceImages = ["dado1", "dado2", "dado3", "dado4", "dado5", "dado6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateRandomDices()
    }

    @IBAction func rollPressed(_ sender: UIButton) {
        generateRandomDices()
    }
    
    func generateRandomDices() {
        
    }
    
}

