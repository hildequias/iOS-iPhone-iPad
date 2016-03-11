//
//  ViewController.swift
//  Demo_MediaPlayer
//
//  Created by Mobile6 on 3/10/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playVideo(sender: UIButton) {
        
        let playerController: AVPlayerViewController = AVPlayerViewController()
        
        // Path do arquivo de video
        let videoPath: NSURL = NSBundle.mainBundle().URLForResource("big-buck-bunny-clip", withExtension: "m4v")!
        
        // Inicializa o player com o video recuperado
        playerController.player = AVPlayer(URL: videoPath)
        
        // Configura o frame do video
        playerController.view.frame = CGRectMake(20, 270, 280, 150)
        
        // Adiciona o player a view
        self.view.addSubview(playerController.view)
        
        // Inicia o video
        playerController.player!.play()
        
    }

}

