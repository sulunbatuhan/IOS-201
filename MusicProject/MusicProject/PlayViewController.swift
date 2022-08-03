//
//  PlayViewController.swift
//  MusicProject
//
//  Created by batuhan on 2.08.2022.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {

    // MARK: - Property
    
    @IBOutlet weak var PlayView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var musicTiming: UIView!
    
    
    
    
    public var musicList : [music] = []
    public var row = 0
    
    var AVPlayer : AVAudioPlayer?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
    }
    override func viewWillDisappear(_ animated: Bool) {
        if let AVPlayer = AVPlayer {
            AVPlayer.stop()
        }
        
    }
    
   

    
    // MARK: - Method
    
    
    func set(){
        let music = musicList[row]
        imageView.image = UIImage(named: music.musicImage)
        musicName.text = music.musicName
        artistName.text = music.artistName
    
        
        let Audio = Bundle.main.path(forResource: music.musicName, ofType: "mp3")
        do {
        try AVAudioSession.sharedInstance().setMode(.default)
        try AVAudioSession.sharedInstance().setActive(true, options: AVAudioSession.SetActiveOptions.notifyOthersOnDeactivation)
            
            
        guard let Audio = Audio else {return}
            AVPlayer = try AVAudioPlayer(contentsOf: URL(string: Audio)!)
        guard let AVPlayer = AVPlayer else {return}
            AVPlayer.play()
            
            
            AVPlayer.volume = 0.5
           
            
        }catch{
            print(error.localizedDescription)
        }
    }
    


    @IBAction func PrevButton(_ sender: UIButton) {
        if row > 0 {
            row -= 1
            AVPlayer?.stop()
            
        }
        set()
    }
    
    
    @IBAction func PlayButton(_ sender: UIButton) {
        
        if AVPlayer?.isPlaying == true{
            //stop
            AVPlayer?.stop()
        }else{
            AVPlayer?.play()
        }
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        if row < musicList.count{
            row += 1
            AVPlayer?.stop()
        }
        set()
    }
    
    
    
    @IBAction func Volume(_ sender: UISlider) {
        AVPlayer?.volume = sender.value
   
    }
    
   
}
