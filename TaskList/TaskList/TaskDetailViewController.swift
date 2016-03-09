//
//  TaskDetailViewController.swift
//  TaskList
//
//  Created by Mobile6 on 3/8/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {

    var managedObjectContext:NSManagedObjectContext?
    
    @IBOutlet var txtDesc:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTask(){
        
        // Cria uma variavel para referenciar a tabela task
        let entityDescription = NSEntityDescription.entityForName("Task", inManagedObjectContext: self.managedObjectContext!)
        
        // Cria uma instancia da task
        let task = Task(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        // Atribui o valor nome para instancia da task
        task.nome = self.txtDesc.text!
        
        // Salva a task criada
        
        do {
            
            try self.managedObjectContext!.save()
            
            // Apos adicao com sucesso, retorna a tela de listagem de tasks
            self.navigationController?.popViewControllerAnimated(true)
            
        } catch {
            // Escreve erro quando existe
            print("Erro ao salvar task")
        }
        
        // Adicionar task no banco
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
