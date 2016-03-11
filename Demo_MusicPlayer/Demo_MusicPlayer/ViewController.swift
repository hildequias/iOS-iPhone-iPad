//
//  ViewController.swift
//  Demo_MusicPlayer
//
//  Created by Mobile6 on 3/10/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var musicPlayer: AVAudioPlayer?
    var updateTimer:NSTimer?
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Path local do arquivo de musica
        let musicPath: NSURL = NSURL(string:NSBundle.mainBundle().pathForResource("musica", ofType: "mp3")!)!
        
        // Inicializa o player com o path 
        do {
            self.musicPlayer = try AVAudioPlayer(contentsOfURL: musicPath)
            self.musicPlayer?.volume = 0.5
            
        } catch {
            print("erro ao iniciar som com o arquivo especificado")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickButtonItem(sender: UIBarButtonItem) {
        
        switch (sender.tag) {
            case 0:
                self.musicPlayer?.play()
                break;
            
            case 1:
                self.musicPlayer?.pause()
                break;
            
            case 2:
                self.musicPlayer?.stop()
                break;

            default:
                break;
        }
        
    }

    @IBAction func volume(sender: UISlider) {
        
        let progress:Float = Float(self.musicPlayer!.currentTime) / Float(self.musicPlayer!.duration)
        
        self.progress.setProgress(progress, animated: true)
    }
    
}

