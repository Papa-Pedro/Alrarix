//
//  InputInfoOne.swift
//  MachanismsOOP
//
//  Created by Tim Ferens on 01.01.2020.
//  Copyright © 2020 Tim Ferens. All rights reserved.
//

import UIKit

class NumberInfoViewController: UIViewController {
    
    var size: Int?
    
    @IBOutlet weak var sizeField: UITextField!

   /* @IBAction func pushNextView(_ sender: Any) {
        guard sizeField.text! == "" else { return }
       //  performSegue(withIdentifier: "nextOne", sender: nil)
    }*/
    
    override func viewDidLoad() {
        sizeField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let landingVC = segue.destination as? NumberOneViewController else { return }
        
       // landingVC.a = Int(sizeField.text)
    }

    
}
