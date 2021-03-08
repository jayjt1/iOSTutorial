//
//  AudioVideoViewController.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 08/03/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AudioVideoViewController: UIViewController {
    
    
    var audioPlayer : AVAudioPlayer?
    var videoPlayer : AVPlayer?
    var mediaController : AVPlayerViewController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        playAudio()
        self.playVideo()

    }
    
    
    func playAudio() {
        
        
        if let path = Bundle.main.path(forResource: "MittiDiKhushboo", ofType: "mp3") {
            
            if let contents : URL = URL(fileURLWithPath: path) as! URL {
                
                do {
                    try audioPlayer = AVAudioPlayer(contentsOf: contents)
                } catch {
                    
                print("Audio Error")
                }
               
            }
                
            }
        }
    
    // https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4

    
    func playVideo() {
    
        if let contents : URL = URL(fileURLWithPath: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4") as! URL {
            
            do {
                try videoPlayer = AVPlayer(url: contents)
                
            } catch {
                
                print("Video Error")
            }
        }
    }
    

   // custom listener
    
    @IBAction func btnStartClicked(_ sender: Any) {
      //  audioPlayer?.play()
        
        guard let url = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4") else {
            return
        }
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)
        
        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
        
        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }
    
    @IBAction func btnStopClicked(_ sender: Any) {
        
        audioPlayer?.stop()
    }
    
}
