//
//  DetalheViewController.swift
//  Demo_Book
//
//  Created by Mobile6 on 2/22/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

protocol DetalheViewControllerDelegate: class {
    func buttonTappedWithPart(numTapped:Int)
}

class DetalheViewController: UIViewController {
    
    var itemIdx: Int = 0
    var isFromLivro: Bool = false
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var itemTituloLabel: UILabel!
    @IBOutlet weak var part1Button: UIButton!
    @IBOutlet weak var part2Button: UIButton!
    
    weak var delegate:DetalheViewControllerDelegate?
    
    var livrosArr: [String] = ["Futbol - Uma janela para o Brasil", "A terra dos sonhos", "Manga", "Como se faz"]
    var filmesArr:[String] = ["2012", "Avatar", "Thor", "Underworld"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.isFromLivro) {
            self.closeButton.hidden = false
            self.tituloLabel.text = "Livro"
            self.itemTituloLabel.text = livrosArr[self.itemIdx]
            self.part1Button.hidden = true;
            self.part2Button.hidden = true;
        } else {
            self.closeButton.hidden = true
            self.tituloLabel.text = "Filme"
            self.itemTituloLabel.text = filmesArr[self.itemIdx]
        }
    }
    
    @IBAction func closeTap(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func buttonPartTap(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        self.delegate?.buttonTappedWithPart(sender.tag)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mySegue") {
        //...
        }
    }
    
    // MARK: - Death Cycle
    override func viewDidDisappear(animated: Bool) {
        //...
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}