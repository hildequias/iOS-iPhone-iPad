//
//  ViewController.swift
//  Demo_Connection_JSON_WebView
//
//  Created by Mobile6 on 2/27/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // URL de acesso a API do itunes, que retorna o aplicativo gratuito no topo do ranking na app store
    let url = NSURL (string:"http://itunes.apple.com/br/rss/topfreeapplications/limit=1/json")!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txName: UILabel!
    
    var session: NSURLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig)
        
        let task = session!.dataTaskWithURL(url,
            completionHandler: {(data: NSData?, response:NSURLResponse?, error: NSError?) -> Void in
            
            //ações efetuadas quando a execução da task se completa
            if (error == nil) {
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.txName.text = self.getTopFreeName(data!)
                })
            }
        })
    
        
        // Disparo da execucao da task  
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTopFreeName(data: NSData) -> String? {
            
        var retStr: String? = nil
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
            if let feed = json["feed"] as? [String: AnyObject] {
                if let entry = feed["entry"] as? [String: AnyObject] {
                    if let name = entry["im:name"] as? [String: AnyObject] {
                        if let label = name["label"] as? String {
                            retStr = label
                        }
                    }
                    if let name = entry["im:image"] as? [[String: AnyObject]] {
                        if let label = name[0]["label"] as? String {
                            self.downloadImage(label)
                        }
                    }
                }
            }
        }catch {
            print("Erro no parser JSON")
            return nil
        }
        return retStr
    }
    
    // Função que configura uma task para donwload de imagem do URL do parâmetro
    func downloadImage(imgURL: String) {
        
        let url = NSURL(string: imgURL)!
        let imageSession = NSURLSession.sharedSession()
        let imgTask = imageSession.downloadTaskWithURL(url) { (url, response, error) -> Void in
            if (error == nil) {
                if let imageData = NSData(contentsOfURL: url!) {
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.imageView.image = UIImage(data: imageData)
                    })
                }
            } else {
                
            }
        }
        imgTask.resume()
    }
    
}

