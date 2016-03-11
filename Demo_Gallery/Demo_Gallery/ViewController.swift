//
//  ViewController.swift
//  Demo_Gallery
//
//  Created by Mobile6 on 3/10/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func choosePhoto(sender: UIButton) {
        
        // Instância de UIImagePickerController qeu apresenta navegação na biblioteca
        let pickerController:UIImagePickerController = UIImagePickerController()
        pickerController.delegate = self
        
        // Definimos o tipo da UIImagePickerController, no caso será PhotoLibrary (biblioteca de imagens)
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        // Apresentamos a UIImagePickerController na tela
        self.presentViewController(pickerController, animated: true, completion: nil)
        
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // Recupera a imagem selecionada 
        let img:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Implementacao...
        image.image = img
        
        // Fecha a tela de selecao da imagem
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}

