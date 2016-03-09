//
//  ViewController.swift
//  Demo_WebView
//
//  Created by Mobile6 on 2/27/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var seachBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string:"http://fiap.com.br")!
        let request = NSURLRequest(URL:url)
        
        self.webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        var urlStr:String = searchBar.text!
        urlStr.hasPrefix("http://")
        
        if(urlStr.rangeOfString("http://", options: [], range: nil, locale: nil) == nil &&
            urlStr.rangeOfString("https://", options: [], range: nil, locale: nil) == nil){
        
            urlStr = ("http://\(urlStr)")
        }
        
        let url = NSURL(string:urlStr)!
        let request = NSURLRequest(URL:url)
        self.webView.loadRequest(request)
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

}

