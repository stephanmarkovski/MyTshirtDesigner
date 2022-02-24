//
//  designViewController.swift
//  MyTshirtDesigner
//;
//  Created by Vincent Diliberto on 1/25/22.
//

import UIKit

class designViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
  
    
    

    @IBOutlet weak var labell: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var text = String()
    var font = UIFont()
    var textcolor = UIColor()
    
    @IBOutlet weak var myTextLabel: UILabel!
    var lastLocation = CGPoint(x: 0, y: 0)
    var lastRotation: CGFloat = 0.000001
    var lastScale:CGFloat = 0
    var longPressRun = true
    var images = [UIImageView]()
    
    var advancedOn = false
    var x = Double()
    var y = Double()
    var rotation = Double()
    var color = UIColor()
    var center = CGPoint(x: 0, y: 0)
    
    var pickerView = UIPickerView()
    var tempSelected = 0
    var layout:UICollectionViewFlowLayout!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imagedesign: UIImageView!
    @IBOutlet weak var myTextField: UITextField!
    var fontChoices = ["Old Sport Athletic","Brush Script MT Italic","Bebas"]
    var colorChoices = ["Hersey Orange","Hersey Brown","Opaque White","Hersey Charcoal","Hersey Gray"]
    var tempChoices = ["Blank","White Shirt","Black Shirt","Orange Shirt"]
 var colorSelected = 0
    var selectedFont = "OLDSPORT02ATHLETICNCV"
    var colorValue = UIColor(red: 255.0/255, green: 103.0/255, blue: 27.0/255, alpha: 1.0)
    var fontSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
//        let tapRecognizer = UIPinchGestureRecognizer(target:self, action:#selector(detectTap))
//        self.view.addGestureRecognizer(tapRecognizer)
//        
//        
        currentData = data
        currentSizes = dataSizes
        imagedesign.layer.masksToBounds = true
        imagedesign.layer.borderWidth = 1.5
        imagedesign.layer.borderColor = UIColor.white.cgColor
        imagedesign.layer.cornerRadius = imagedesign.bounds.width / 2
        
      //  scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
      //  scrollView.backgroundColor = .systemTeal
      //  scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: UIScreen.main.bounds.height*100)
      //  view.addSubview(scrollView)
        
        for i in 0...100 {
             
            images.append(UIImageView(image: UIImage(systemName: "person.3.fill")))
             images[i].frame = CGRect(x: 0, y: UIScreen.main.bounds.height*CGFloat(i), width: view.frame.width, height: view.frame.height)
             images[i].contentMode = .scaleAspectFit
             collectionView.addSubview(images[i])
            
            
            
           }

        var tshirtTitle = myTextField.text!
        var name = myTextField.text!
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func fontAlert() {
        
        // #### Creates an Alert to Change the Template Background #### //
        
        let textAlert = UIAlertController(title: "Choose Text", message: "\n\n\n\n", preferredStyle: UIAlertController.Style.alert)
        
        
        let pickerViewFont = UIPickerView(frame: CGRect(x: 25, y: 30, width: 200, height: 100))
        

        
        textAlert.view.addSubview(pickerViewFont)
        pickerViewFont.dataSource = self
        pickerViewFont.delegate = self
        
        pickerViewFont.tag = 2
        textAlert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Text"
        }
       
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { [self] alert -> Void in
            let addedText = textAlert.textFields?[0].text
            labell.textColor = .red
            
            if labell.text == labell.text {
                
                labell.font = UIFont(name: "Old Sport Athletic", size: 80)
                
                labell.text = "\(addedText)"
            } else {
                labell.font = UIFont(name: "Brush Script MT Italic", size: 80)
                
                labell.text = "\(addedText)"
            
            }
        
           
           
            
          
                //            if !addedText!.isEmpty{
//                if let addedSize = Double(addedSizeString) {
//                    self.text = addedText!
//                    self.lastScale = CGFloat(addedSize)
//
//                    self.font = UIFont(name: self.selectedFont, size: CGFloat(addedSize))!
//                    self.textcolor = self.colorValue
//                    self.myTextLabel.sizeToFit()
//                    self.myTextLabel.textAlignment  =  .center
//                    self.fontSelected = pickerViewFont.selectedRow(inComponent: 0)
//                } else {
//                    let addedText = textAlert.textFields?[0].text
//                    let addedSize = textAlert.textFields?[1].text
//
//                    self.text = addedText!
//                    self.lastScale = CGFloat(Double(addedSize!)!)
//                    self.font = UIFont(name: self.selectedFont, size: CGFloat(Double(addedSize!)!))!

//                    self.textcolor = self.colorValue
//                    self.name.sizeToFit()
//                    self.name.textAlignment = .center
//                    self.fontSelected = pickerViewFont.selectedRow(inComponent: 0)
//
//               }
//            }
//            if (self.advancedOn) {
//                if let x = Double((textAlert.textFields?[2].text)!) {
//                    addedLocationX = CGFloat(x)
//                    self.name.center.x  = addedLocationX
//                }
//                if let y = Double((textAlert.textFields?[3].text)!) {
//                    addedLocationY = CGFloat(y)
//                    self.name.center.y = addedLocationY
//                }
//                if let r = Double((textAlert.textFields?[4].text)!) {
//                    self.name.transform =  CGAffineTransform(rotationAngle: CGFloat(r + 0.000001))
//                    self.lastRotation = CGFloat(r +  0.000001)
//                }
//
//                textAlert.addTextField { (textField) in
//                    textField.placeholder = "Type X Location"
//                    textField.text = "\(self.center.x)"
//                }
//
//                textAlert.addTextField { (textField) in
//                    textField.placeholder = "Type Y Location"
//                    textField.text = "\(self.center.y)"
//                }
//
//                textAlert.addTextField { (textField) in
//                    textField.placeholder = "Type Rotation"
//                    textField.text = "\(String(format: "%.4f", self.lastRotation))"
//                }
//            }
//            self.lastLocation = self.name.center




            })
        
        textAlert.view.addSubview(pickerViewFont)
        
        pickerViewFont.dataSource = self
        pickerViewFont.delegate = self
        
        let cancelAction = UIAlertAction(title: "Back", style: UIAlertAction.Style.cancel, handler: nil)
        textAlert.addAction(cancelAction)
//        myTextLabel.text = myTextField.text!
       
        textAlert.addAction(saveAction)
            
            self.present(textAlert, animated: true, completion: nil)
            
        }
   
//    @objc func detectTap(_ gestureRecognizer : (UITapGestureRecognizer) {
//////        gestureRecognizer.touchesBegan(Set<UITouch>, with: UIEvent)
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       
        // #### Number of Sections in PickerView #### //
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        // #### Determin the Number of Components in the PickerView #### //
        // #### Test for PickerView Tags #### //
        
        if pickerView.tag == 0 {
            return colorChoices.count
        } else if pickerView.tag == 1 {
            return tempChoices.count
        } else {
            return fontChoices.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        // #### Determin the Components in the PickerView #### //
        // #### Test for PickerView Tags #### //
        
        if pickerView.tag == 0 {
            return colorChoices[row]
        } else if pickerView.tag == 1 {
            return tempChoices[row]
        } else {
            return fontChoices[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // #### Testfor the Selected Row in the CollectionView #### //
        
        if row == 0 {
            if pickerView.tag == 0 {
                colorValue = UIColor(red: 255.0/255, green: 103.0/255, blue: 27.0/255, alpha: 1.0)
                colorSelected = 0
            } else if pickerView.tag == 1 {
                tempSelected = 0
            } else if pickerView.tag == 2 {
                selectedFont = "OLDSPORT02ATHLETICNCV"
                fontSelected = 0
            }
            
        } else if row == 1 {
            if pickerView.tag == 0 {
                colorValue = UIColor(red: 81.0/255, green: 54.0/255, blue: 40.0/255, alpha: 1.0)
                colorSelected = 1
                print(colorSelected)
            } else if pickerView.tag == 1 {
                tempSelected = 1
            } else if pickerView.tag == 2 {
                selectedFont = "BrushScriptStd"
                fontSelected = 1
            }
            
        } else if row == 2 {
            if pickerView.tag == 0 {
                colorValue = UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 1.0)
                colorSelected = 2
            } else if pickerView.tag == 1 {
                tempSelected = 2
            } else if pickerView.tag == 2 {
                selectedFont = "Bebas"
                fontSelected = 2
            }
            
        } else if row == 3 {
            if pickerView.tag == 0 {
                colorValue = UIColor(red: 100.0/255, green: 101.0/255, blue: 105.0/255, alpha: 1.0)
                colorSelected = 3
            } else if pickerView.tag == 1 {
                tempSelected = 3
            } else if pickerView.tag == 2 {
                
            }
            
        } else if row == 4 {
            if pickerView.tag == 0 {
                colorValue = UIColor(red: 202.0/255, green: 200.0/255, blue: 200.0/255, alpha: 1.0)
                colorSelected = 4
            } else if pickerView.tag == 1 {
                
            } else if pickerView.tag == 2 {
                
            }
        }
    }
    
        @IBAction func editbutton(_ sender: UIBarButtonItem) {
        imagedesign.image = UIImage()
    }
    
    @IBAction func TemplateButton(_ sender: Any) {
        
         tempSelected = 0
        tempAlert()
        
    }
   
    @IBAction func myFontButtonFr(_ sender: Any) {
        fontAlert()
        
    }
    
    func tempAlert() {
        
        // #### Creates an Alert to Change the Template Background #### //
        
        let textAlert = UIAlertController(title: "Change Template", message: "\n\n\n\n", preferredStyle: UIAlertController.Style.alert)
        
        let pickerViewTemp = UIPickerView(frame: CGRect(x: 25, y: 30, width: 200, height: 100))
        pickerViewTemp.tag = 1
        
        textAlert.view.addSubview(pickerViewTemp)
        pickerViewTemp.dataSource = self
        pickerViewTemp.delegate = self
        
        let cancelAction = UIAlertAction(title: "Back", style: UIAlertAction.Style.cancel, handler: nil)
        textAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default) { (action) in
    
            // #### Changes Background Image to Selected Template #### //
            
            if self.tempSelected == 0 {
                self.imagedesign.image = UIImage()
            } else if self.tempSelected == 1 {
                self.imagedesign.image = UIImage(named:"white_shirt")
            } else if self.tempSelected == 2 {
                self.imagedesign.image = UIImage(named:"black_shirt")
            } else if self.tempSelected == 3 {
                self.imagedesign.image = UIImage(named:"orange_shirt")
            }
        }
        
        textAlert.addAction(addAction)
        self.present(textAlert, animated: true, completion: nil)
        
    }
   
    var currentData: [UIImage] = []
    var currentSizes: [CGSize] = []
    
    let data: [UIImage] = [#imageLiteral(resourceName: "FULL FACE dark background"),#imageLiteral(resourceName: "JUST THE H"),#imageLiteral(resourceName: "PRIMARY LOGO dark background"),#imageLiteral(resourceName: "stripes face")]
    let dataSizes: [CGSize] = [CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 144, height: 100),CGSize(width: 180, height: 75)]
    
    let huskyFaces: [UIImage] = [#imageLiteral(resourceName: "FULL FACE brown_white"),#imageLiteral(resourceName: "FULL FACE dark background"),#imageLiteral(resourceName: "FULL FACE light background"),#imageLiteral(resourceName: "FULL FACE orange"),#imageLiteral(resourceName: "FULL FACE white")]
    let huskyFaceSizes: [CGSize] = [CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100)]
    let herseyHs: [UIImage] = [#imageLiteral(resourceName: "JUST THE H"),#imageLiteral(resourceName: "JUST THE H2"),#imageLiteral(resourceName: "H DOG"),#imageLiteral(resourceName: "LOCKUP")]
    let herseyHSizes: [CGSize] = [CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100)]
    let herseyLogo: [UIImage] = [#imageLiteral(resourceName: "PRIMARY LOGO dark background"),#imageLiteral(resourceName: "PRIMARY LOGO light background"),#imageLiteral(resourceName: "SECONDARY LOGO 1 light background"),#imageLiteral(resourceName: "SECONDARY LOGO 2 dark background"),#imageLiteral(resourceName: "SECONDARY LOGO 2 light background"),#imageLiteral(resourceName: "SECONDARY LOGO 2 WHITE"),#imageLiteral(resourceName: "SECONDARY LOGO 2a dark background")]
    let herseyLogoSizes: [CGSize] = [CGSize(width: 144, height: 100),CGSize(width: 144, height: 100),CGSize(width: 144, height: 100),CGSize(width: 175, height: 100),CGSize(width: 175, height: 100),CGSize(width: 175, height: 100),CGSize(width: 175, height: 100)]
    let herseyStripes: [UIImage] = [#imageLiteral(resourceName: "stripes face"),#imageLiteral(resourceName: "STRIPES H"),#imageLiteral(resourceName: "STRIPES")]
    let herseyStripeSizes: [CGSize] = [CGSize(width: 180, height: 75),CGSize(width: 180, height: 75),CGSize(width: 180, height: 75)]
    var imageTypeSelected = -1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #### Number of Sections in CollectionView #### //
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #### Determin the Number of Components in the CollectionView #### //
        
        if collectionView.tag == 0 {
            return data.count
        } else if collectionView.tag == 1{
            switch imageTypeSelected {
            case 0:
                return huskyFaces.count
            case 1:
                return herseyHs.count
            case 2:
                return herseyLogo.count
            case 3:
                return herseyStripes.count
            default:
                break
            }
            
        }
       
        return 0
    }
    
    func collectionView(_ selectedCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
                if selectedCollectionView.tag == 0 {
       
        let cell = selectedCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        let image: UIImage = currentData[indexPath.row]
        
        var imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//                    var imageView:UIImageView=UIImageView(frame: CGRect(x: 0, y: 0, width: dataSizes[indexPath.row].width, height: dataSizes[indexPath.row].height))
        layout.itemSize = CGSize(width: currentSizes[indexPath.row].width, height: 100)
        for _ in currentSizes {
            if (currentSizes[indexPath.row].height<100){
                imageView = UIImageView(frame: CGRect(x: 0, y: (100-currentSizes[indexPath.row].height)/2, width: currentSizes[indexPath.row].width, height: currentSizes[indexPath.row].height))
            } else {
                imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: currentSizes[indexPath.row].width, height: currentSizes[indexPath.row].height))
            }
        }
        
     

        imageView.image = image
        
        cell.contentView.addSubview(imageView)
        return cell
                }
        return collectionView(<#T##selectedCollectionView: UICollectionView##UICollectionView#>, cellForItemAt: <#T##IndexPath#>)
    }
    
}


