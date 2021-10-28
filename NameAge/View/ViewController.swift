//
//  ViewController.swift
//  NameAge
//
//  Created by Daniel Washington Ignacio on 28/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    var controller: NameAgeController = NameAgeController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        

    }
    @IBAction func checkAgeButton(_ sender: UIButton) {
        
        self.controller.nameFunc(nameFunc: nameTextField.text ?? "")
        self.controller.getAge{ result, error in
            if result {
                for n in self.controller.arrayNameAge{
                    self.resultLabel.text = "Name:\(n.name), Your Age: \(n.age)"
                }
            }else{
                print("erro")
            }
            
        }
    }
    

}

