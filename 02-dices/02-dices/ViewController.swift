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
    let diceImages: [String]
    let nFaces : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        diceImages = ["dado1", "dado2", "dado3", "dado4", "dado5", "dado6"]
        nFaces = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateRandomDices()
    }

    @IBAction func rollPressed(_ sender: UIButton) {
        generateRandomDices()
    }
    
    func generateRandomDices() {
        
        //Generar aleatoriamente y cambiar el dado izquierdo
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        let nameImageDiceLeft = diceImages[randomDiceIndexLeft]
        imageViewDiceLeft.image = UIImage(named: nameImageDiceLeft)
        
        //Generar aleatoriamente y cambiar el dado derecho
        randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        let nameImageDiceRight = diceImages[randomDiceIndexRight]
        imageViewDiceRight.image = UIImage(named: nameImageDiceRight)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: {
                        self.imageViewDiceLeft.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
                        
                        self.imageViewDiceRight.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
                        
                        self.imageViewDiceRight.alpha = 0.0
                        self.imageViewDiceLeft.alpha = 0.0
        }) { (completed) in
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRight.transform = CGAffineTransform.identity
            
            self.imageViewDiceRight.alpha = 1.0
            self.imageViewDiceLeft.alpha = 1.0
            
            self.imageViewDiceLeft.image = UIImage(named: nameImageDiceLeft)
            self.imageViewDiceRight.image = UIImage(named: nameImageDiceRight)
        }

    }
    
}

