//
//  designViewController.swift
//  MyTshirtDesigner
//
//  Created by Vincent Diliberto on 1/25/22.
//

import UIKit

class designViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imagedesign: UIImageView!
    @IBOutlet weak var myTextField: UITextField!
    var fontChoices = ["Old Sport Athletic","Brush Script MT Italic","Bebas"]
    var colorChoices = ["Hersey Orange","Hersey Brown","Opaque White","Hersey Charcoal","Hersey Gray"]
 var colorSelected = 0
    var selectedFont = "OLDSPORT02ATHLETICNCV"
    var colorValue = UIColor(red: 255.0/255, green: 103.0/255, blue: 27.0/255, alpha: 1.0)
    var fontSelected = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        var tshirtTitle = myTextField.text!
        var name = myTextField.text!
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myFontButton(_ sender: Any) {
//        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//            if pickerView.tag == 0 {
//
//            }
//            return myFonts.count
//        }
//        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//            if pickerView.tag == 0 {}
//            return myFonts[row]
//
        }
    

func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView.tag == 0 {
        return colorChoices.count
    } else {
        return fontChoices.count
    }
    
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView.tag == 0 {
        return colorChoices[row]
    } else {
        return fontChoices[row]
    }
    
}

func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if row == 0 {
        if pickerView.tag == 0 {
            colorValue = UIColor(red: 255.0/255, green: 103.0/255, blue: 27.0/255, alpha: 1.0)
            self.colorSelected = 0
        } else if pickerView.tag == 1 {
            print("Blank Temp")
        } else if pickerView.tag == 2 {
            selectedFont = "OLDSPORT02ATHLETICNCV"
            self.fontSelected = 0
        }
        
    } else if row == 1 {
        if pickerView.tag == 0 {
            colorValue = UIColor(red: 81.0/255, green: 54.0/255, blue: 40.0/255, alpha: 1.0)
            self.colorSelected = 1
        } else if pickerView.tag == 1 {
            print("White T-shirt Temp")
        } else if pickerView.tag == 2 {
            selectedFont = "BrushScriptStd"
            self.fontSelected = 1
        }
        
    } else if row == 2 {
        if pickerView.tag == 0 {
            colorValue = UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 1.0)
            self.colorSelected = 2
        } else if pickerView.tag == 1 {
            print("Black T-shirt Temp")
        } else if pickerView.tag == 2 {
            selectedFont = "Bebas"
            self.fontSelected = 2
        }
        
    } else if row == 3 {
        if pickerView.tag == 0 {
            colorValue = UIColor(red: 100.0/255, green: 101.0/255, blue: 105.0/255, alpha: 1.0)
            self.colorSelected = 3
        } else if pickerView.tag == 1 {
            
        } else if pickerView.tag == 2 {
                       
        }
        
    } else if row == 4 {
        if pickerView.tag == 0 {
            colorValue = UIColor(red: 202.0/255, green: 200.0/255, blue: 200.0/255, alpha: 1.0)
            self.colorSelected = 4
        } else if pickerView.tag == 1 {
            
        } else if pickerView.tag == 2 {
                       
        }
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
        imagedesign.image = UIImage()
    }
    


}
