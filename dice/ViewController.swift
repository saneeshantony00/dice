//
//  ViewController.swift
//  dice
//
//  Created by saneesh antony on 2020-10-21.
//

import UIKit
import AVFoundation

 var audioplayer = AVAudioPlayer();
var buttonclick = AVAudioPlayer();

class ViewController: UIViewController {
    
    

    @IBOutlet weak var txt: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!

    @IBOutlet weak var rightImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = Bundle.main.path(forResource: "jackpot", ofType: "mp3")
        
        let playagain = Bundle.main.path(forResource: "buttonclick", ofType: "mp3")
    
        // Do any additional setup after loading the view.
        
        do{
            audioplayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            buttonclick = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: playagain!))
        }
        catch{
            print(error)
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        buttonclick.play()
        
        let numberOne = arc4random_uniform(6) + 1
                
            let numberTwo = arc4random_uniform(6) + 1
        leftImageView.image = UIImage(named: "dice\(numberOne)")
        rightImageView.image = UIImage(named: "dice\(numberTwo)")
               if numberOne == numberTwo {
                  txt.text = "BINGO"
                audioplayer.play()
                
                    }
                    else
                     {
                      txt.text = "Unlucky"
                     }
        
                    }
}

