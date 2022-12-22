//
//  ViewController.swift
//  IMC
//
//  Created by Rafael Veronez Dias on 19/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    var imc: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
       if let weight = Double(weightTextField.text!),
          let height = Double(heightTextField.text!.replacingOccurrences(of: ",", with: ".")) {
                      
           imc = weight / (height * height)
           
           showResults()
           
       }
        
    }
    
        func showResults() {
            var results: String = ""
            var image: String = ""

            switch imc {
                case 0..<16:
                    results = "Magreza"
                    image = "magreza"
                case 16..<18.5:
                    results = "Abaixo do peso"
                    image = "magreza"
                case 18.5..<25:
                    results = "Peso ideal"
                    image = "ideal"
                case 25..<30:
                    results = "Sobrepeso"
                    image = "sobre"
                default:
                    results = "Obesidade"
                    image = "obesidade"
            }

            resultLabel.text = "\(Int(imc)): \(results)"
            resultImageView.image = UIImage(named: image)
            resultView.isHidden = false
            view.endEditing(true)
    }
}

