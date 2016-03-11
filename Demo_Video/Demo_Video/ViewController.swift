//
//  ViewController.swift
//  Demo_Video
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
        
        // Monta a url do video remoto
        let videoPath: NSURL = NSURL(string: "http://dl.dropboxusercontent.com/u/7902152/FIAP/movie.mp4")!
        
        // Instancia o movie player com a URL
        playerController.player = AVPlayer(URL: videoPath)
        
        // Configura o frame do video
        playerController.view.frame = CGRectMake(20, 270, 280, 150)
        
        // Adiciona o player a view
        self.view.addSubview(playerController.view)
    }
    


}

