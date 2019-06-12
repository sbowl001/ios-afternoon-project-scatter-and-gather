//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Stephanie Bowles on 6/12/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    
    private var isScattered: Bool = true
    private var labels = [UILabel]()
    private var colors : [UIColor] = [
        .blue,
        .purple,
        .green,
        .yellow,
        .orange,
        .red,
        .gray
        
    ]
    @IBOutlet weak var lambdaImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        labels = [lLabel, aLabel, mLabel, bLabel, dLabel, secondALabel]
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        if self.isScattered == true {
            scatterAnimation()
        } else {
            gatherAnimation()
        }
        isScattered.toggle()
    }

    
    func scatterAnimation(){
        
//        for _ in 1...3 {
//            print(Int.random(in: 1...100))
//        }
        let animationBlock = {
            self.lambdaImage.alpha = 0
            for label in self.labels {
                let randomX = CGFloat.random(in: 0...100)
                let randomY = CGFloat.random(in: -10...50)
                label.transform = CGAffineTransform(scaleX: randomX, y: -randomY)
                label.transform = CGAffineTransform(translationX: randomX, y: randomY)
                label.transform = CGAffineTransform(rotationAngle: randomX)
                label.textColor = self.colors.randomElement()
//                label.backgroundColor = self.colors.randomElement()
            }
        }
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: animationBlock, completion: nil)
       
      
    }
    
    func gatherAnimation(){
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {
            self.lambdaImage.alpha = 1
//            self.lambdaImage.transform = .identity
            for label in self.labels {
                label.transform = .identity
                label.textColor = .black
//                UIView.addKeyframe(withRelativeStartTime: 2.5, relativeDuration: 0.5, animations: {
//                     label.textColor = .black
//                })
               
            }
        }, completion: nil)
      
    }
}

