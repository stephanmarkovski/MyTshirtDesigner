//
//  designViewController.swift
//  MyTshirtDesigner
//
//  Created by Vincent Diliberto on 1/25/22.
//

import UIKit

class designViewController: UIViewController {
    @IBOutlet weak var myTextField: UITextField!
    var myFonts = ["Italic" , "Lobster" , "Satisfy"]
    override func viewDidLoad() {
        super.viewDidLoad()
        var tshirtTitle = myTextField.text!
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myFontButton(_ sender: Any) {
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView.tag == 0 {
                
            }
            return myFonts.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView.tag == 0 {}
            return myFonts[row]
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func editbutton(_ sender: UIBarButtonItem) {
        
    }
    

}
