//
//  ViewController.swift
//  askted
//
//  Created by Alvin Harjanto on 1/29/18.
//  Copyright © 2018 Alvin Harjanto. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, AVAudioPlayerDelegate, UITextFieldDelegate {
    
    var answerIndex : Int = 0
    var timer : Timer!
    var timer2 : Timer!
    
    var pic1: UIImage! = UIImage(named: "asktedt_1.png")
    var pic2: UIImage! = UIImage(named: "asktedt_2.png")
    var pic3: UIImage! = UIImage(named: "asktedt_3.png")
    
    let empty:String! = ""
    
    var audioPlayer: AVAudioPlayer!
    
    
    var animatedImage: UIImage!
    
    var images: [UIImage]!
    
    

    
    @IBOutlet weak var questionBox: UITextView!
    

    @IBOutlet weak var background: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.questionBox.delegate = self as? UITextViewDelegate
        
        pic1 = UIImage(named: "asktedt_1.png")
        pic2 = UIImage(named: "asktedt_2.png")
        pic3 = UIImage(named: "asktedt_3.png")
        
        images = [pic1, pic2, pic3]
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        questionBox.resignFirstResponder()
        return true
    }

    
    
    func animatedImages(){
        
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)
        
        background.image = animatedImage
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func askButton(_ sender: Any) {
        
        
        let myText = questionBox.text
        let lastChar = myText?.last
        let charSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
        let questionMark = CharacterSet(charactersIn: "?")
        let questionSet = "would"
        
        self.view.endEditing(true)
        
        
        emptyText()
        

        
        answerIndex = Int(arc4random_uniform(4))
        
        if myText?.lowercased().rangeOfCharacter(from: charSet) == nil {
            
            sound4()
            
            background.image = UIImage(named: "askted5.png")
            
            runTimer()
            
        }
            

        else if myText?.rangeOfCharacter(from: questionMark) == nil {
            
            background.image = UIImage(named: "askted4.png")
            
            runTimer()
            
        }
            
        else if myText?.lowercased() == "would you be my valentine ?" || myText?.lowercased() == "would you be my valentine?" || myText?.lowercased() == "will you be my valentine?" || myText?.lowercased() == "would you be my valentine ?" {
            
            if let filePath = Bundle.main.path(forResource: "asktedval_e", ofType: ".mp4") {
                
                let filePathURL = NSURL.fileURL(withPath: filePath)
                
                let player = AVPlayer(url:filePathURL)
                let playerController = AVPlayerViewController()
                playerController.player = player
                self.present(playerController, animated: true) {
                    
                    player.play()
                }
                
            }
            
            
            
        }
            

        
        else if answerIndex == 0 {
            
            
            sound1()
            
            background.image = UIImage(named: "askted2.png")

            runTimer()
            
            
        
        }
        
        else if answerIndex == 1 {
            
            sound2()
            
            background.image = UIImage(named: "askted3.png")
            
            runTimer()
            

            
        }
        
        else if answerIndex == 2 {
            
            animatedImages()
            
            runTimer()
            
            
        }
        
        else if answerIndex == 3 {
            
            sound3()
            
            background.image = UIImage(named: "askted6.png")
            
            runTimer()
            
        }
    }
    
    @objc func animate() {
        
        
        print("done")
        background.image = UIImage(named: "askted1.png")
    
    }
    
    func runTimer() {
        
        
        timer2 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(ViewController.animate)), userInfo: nil, repeats: false)
    }
    
    func emptyText() {
        
        questionBox.text = ""
        
    }
    
    func sound1() {
        
        let soundURL = Bundle.main.url(forResource: "askted_yes", withExtension: ".wav")
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        
        catch {
            
            print(error)
        }
        
        audioPlayer.play()
    
    }
    
    func sound2() {
        
        let soundURL = Bundle.main.url(forResource: "askted_no", withExtension: ".wav")
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
            
        catch {
            
            print(error)
        }
        
        audioPlayer.play()
        
    }
    
    func sound3() {
        
        let soundURL = Bundle.main.url(forResource: "askted_dunno", withExtension: ".wav")
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
            
        catch {
            
            print(error)
        }
        
        audioPlayer.play()
        
    }
    
    func sound4() {
        
        let soundURL = Bundle.main.url(forResource: "askted_nani", withExtension: ".wav")
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
            
        catch {
            
            print(error)
        }
        
        audioPlayer.play()
        
    }
    
    func sound5() {
        
        let soundURL = Bundle.main.url(forResource: "askted_hmm", withExtension: ".wav")
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
            
        catch {
            
            print(error)
        }
        
        audioPlayer.play()
        
    }
    
   


}

class ViewController2: UIViewController {
    
    
    @IBAction func start(_ sender: Any) {
        
        performSegue(withIdentifier: "start", sender: (Any).self)
        
    }
    
}




