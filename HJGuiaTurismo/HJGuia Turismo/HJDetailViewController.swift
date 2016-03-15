//
//  HJDetailViewController.swift
//  HJGuia Turismo
//
//  Created by Usuário Convidado on 12/03/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import UIKit

class HJDetailViewController: UIViewController {
    
    @IBOutlet weak var txTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txAddress: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var location:HJLocationVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(location != nil){
            downloadImage(location.imagem)
            txTitle.text = location.name
            txAddress.text = location.address
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Função que configura uma task para donwload de imagem do URL do parâmetro
    func downloadImage(imgURL: String) {
        
        loading.hidden = false;
        loading.startAnimating()
        
        let url = NSURL(string: imgURL)!
        let imageSession = NSURLSession.sharedSession()
        let imgTask = imageSession.downloadTaskWithURL(url) { (url, response, error) -> Void in
            if (error == nil) {
                if let imageData = NSData(contentsOfURL: url!) {
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.image.image = UIImage(data: imageData)
                        self.loading.hidden = true;
                        self.loading.stopAnimating()
                    })
                }
            } else {
                self.loading.hidden = true;
                self.loading.stopAnimating()
            }
        }
        imgTask.resume()
    }
    
}
