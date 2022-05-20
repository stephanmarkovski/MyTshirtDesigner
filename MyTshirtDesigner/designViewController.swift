//
//  designViewController.swift
//  MyTshirtDesigner
//;
//  Created by Vincent Diliberto on 1/25/22.
//hi

import UIKit

class designViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
   
    
  
    
// variables to use
    @IBOutlet weak var labell: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var text = String()
    var font = UIFont()
    var textcolor = UIColor()
    var selectedImageView: UIImageView?

    var image: UIImage = UIImage()

    var lastLocation = CGPoint(x: 0, y: 0)
    var lastRotation: CGFloat = 0.000001
    var lastScale:CGFloat = 0
    var longPressRun = true
    var images = [UIImageView]()
    var imageTypeSelected = -1
    var advancedOn = false
    var x = Double()
    var y = Double()
    var rotation = Double()
    var color = UIColor()
    var center = CGPoint(x: 400, y: 500)
    var imageView:UIImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    var pickerView = UIPickerView()
    var tempSelected = 0
    var layout:UICollectionViewFlowLayout!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imagedesign: UIImageView!
    
    @IBOutlet weak var myTextField: UITextField!
    var fontChoices = ["OLD SPORT 01 COLLEGE NCV","BrushScriptMTItalic","Bebas"]
    var colorChoices = ["Hersey Orange","Hersey Brown","Opaque White","Hersey Charcoal","Hersey Gray"]
    var tempChoices = ["Blank","White Shirt","Black Shirt","Orange Shirt","Grey Shirt","Brown Shirt"]
 var colorSelected = 0
    var selectedFont = "OLD SPORT 01 COLLEGE NCV"
    var colorValue = UIColor(red: 255.0/255, green: 103.0/255, blue: 27.0/255, alpha: 1.0)
    var fontSelected = 0
    private var initialCenter: CGPoint = CGPoint(x: 300, y: 400)

    override func viewDidLoad() {
        super.viewDidLoad()
        layout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.tag = 0
        imagedesign.isUserInteractionEnabled = true
        labell.isUserInteractionEnabled = true
        collectionView.isUserInteractionEnabled = true
//        let tapRecognizer = UIPinchGestureRecognizer(target:self, action:#selector(detectTap))
//        self.view.addGestureRecognizer(tapRecognizer)
//
     
       

        let drag = UIPanGestureRecognizer(target: self, action: #selector(self.dragGestureRecognizer(gestureRecognizer:)))
        drag.delegate = self
        currentData = data
        currentSizes = dataSizes
        imagedesign.layer.masksToBounds = true
        imagedesign.layer.borderWidth = 1.5
        imagedesign.layer.borderColor = UIColor.white.cgColor
        imagedesign.layer.cornerRadius = imagedesign.bounds.width / 2
        
        labell.addGestureRecognizer(drag)
//
               labell.center = view.center
      
        
     // making image appear
//        for i in 0...100 {
//
//            images.append(UIImageView(image: UIImage(systemName: "person.3.fill")))
//             images[i].frame = CGRect(x: 0, y: UIScreen.main.bounds.height*CGFloat(i), width: view.frame.width, height: view.frame.height)
//             images[i].contentMode = .scaleAspectFit
//             collectionView.addSubview(images[i])
//
//
//
//           }

        
    }
   // Draggesture code
    @IBAction func dragGestureRecognizer( gestureRecognizer: UIPanGestureRecognizer) {
        labell.center = gestureRecognizer.location(in: view)
        labell.translatesAutoresizingMaskIntoConstraints = false
        switch gestureRecognizer.state {
           case .began:
               initialCenter = labell.center

           case .changed:
               let translation = gestureRecognizer.translation(in: view)

               labell.center = CGPoint(x: initialCenter.x + translation.x,
                                             y: initialCenter.y + translation.y)
           default:
               break
           }
    }
    //Alert for font
    func fontAlert() {
        
        // #### Creates an Alert to Change the Template Background #### //
        
        let textAlert = UIAlertController(title: "Choose Text", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: UIAlertController.Style.alert)
        
        
        let pickerViewFont = UIPickerView(frame: CGRect(x: 25, y: 30, width: 200, height: 100))
        let pickerViewColor = UIPickerView(frame: CGRect(x: 25, y: 100, width: 200, height: 100))

        pickerViewFont.tag = 2
        
        textAlert.view.addSubview(pickerViewFont)
        pickerViewFont.dataSource = self
        pickerViewFont.delegate = self
        
        textAlert.view.addSubview(pickerViewColor)
        pickerViewColor.dataSource = self
        pickerViewColor.delegate = self
        
        textAlert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Text"
        }
        
        textAlert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Size"
        }
       // save  alert
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { [self] alert -> Void in
            let addedText = textAlert.textFields?[0].text
            let addedSize = textAlert.textFields?[1].text
            
           
            self.labell.text = addedText
            
            let sum = Double(addedSize!)
//            if selectedFont == fontChoices[0] {
//
//                labell.font = UIFont(name: "OLD SPORT 01 COLLEGE NCV", size: 50)
//
//                labell.text = "\(addedText!)"
//            }
            
            if labell == labell {
                
                
                    labell.font = UIFont(name: selectedFont, size: sum!)
                labell.textColor = colorValue
                
                labell.text = "\(addedText!)"
                
            }

            })
        
        textAlert.view.addSubview(pickerViewFont)
        
        pickerViewFont.dataSource = self
        pickerViewFont.delegate = self
        
        let cancelAction = UIAlertAction(title: "Back", style: UIAlertAction.Style.cancel, handler: nil)
        textAlert.addAction(cancelAction)

       
        textAlert.addAction(saveAction)
            
            self.present(textAlert, animated: true, completion: nil)
            
        }
// Pickerview components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       
        // #### Number of Sections in PickerView #### //
        
        return 1
    }
    //pickerview number of rows
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
    //pickerview for color font etc
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
    
    //pickerview selecting rows and colors w fonts etc
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
                tempSelected = 4
            } else if pickerView.tag == 2 {
                
            }
        }else if row == 5 {
            if pickerView.tag == 0 {
                colorValue = UIColor(red: 5/255, green: 101.0/255, blue: 105.0/255, alpha: 1.0)
                colorSelected = 3
            } else if pickerView.tag == 1 {
                tempSelected = 5
            } else if pickerView.tag == 2 {
                
            }
            }  else if row == 6{
                if pickerView.tag == 0 {
                    colorValue = UIColor(red: 8/255, green: 101.0/255, blue: 105.0/255, alpha: 1.0)
                    colorSelected = 3
                } else if pickerView.tag == 1 {
                 
                } else if pickerView.tag == 2 {
                    
                }
        }
    }
    // edit button code
        @IBAction func editbutton(_ sender: UIBarButtonItem) {
        imagedesign.image = UIImage()
            labell.text = ""
            
        }
    // template button
    @IBAction func TemplateButton(_ sender: Any) {
        
         tempSelected = 0
        tempAlert()
        
    }
   // font button
    @IBAction func myFontButtonFr(_ sender: Any) {
        fontAlert()
        
    }
    @IBAction func saveButton(_ sender: Any) {
    }
    // template alert
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
            } else if self.tempSelected == 4 {
                self.imagedesign.image = UIImage(named:"grey_shirt")
            } else if self.tempSelected == 5 {
                self.imagedesign.image = UIImage(named:"brown_shirt")
            }
        }
        
        textAlert.addAction(addAction)
        self.present(textAlert, animated: true, completion: nil)
        
    }
   // variables for using
    var currentData: [UIImage] = []
    var currentSizes: [CGSize] = []
    
    var data: [UIImage] = [#imageLiteral(resourceName: "FULL FACE dark background"),#imageLiteral(resourceName: "JUST THE H"),#imageLiteral(resourceName: "PRIMARY LOGO dark background"),#imageLiteral(resourceName: "stripes face")]
    let dataSizes: [CGSize] = [CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 144, height: 100),CGSize(width: 180, height: 75)]
    
    var huskyFaces: [UIImage] = [#imageLiteral(resourceName: "FULL FACE brown_white"),#imageLiteral(resourceName: "FULL FACE dark background"),#imageLiteral(resourceName: "FULL FACE light background"),#imageLiteral(resourceName: "FULL FACE orange"),#imageLiteral(resourceName: "FULL FACE white")]
    let huskyFaceSizes: [CGSize] = [CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100)]
    let herseyHs: [UIImage] = [#imageLiteral(resourceName: "JUST THE H"),#imageLiteral(resourceName: "JUST THE H2"),#imageLiteral(resourceName: "H DOG"),#imageLiteral(resourceName: "LOCKUP")]
    let herseyHSizes: [CGSize] = [CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100),CGSize(width: 100, height: 100)]
    let herseyLogo: [UIImage] = [#imageLiteral(resourceName: "PRIMARY LOGO dark background"),#imageLiteral(resourceName: "PRIMARY LOGO light background"),#imageLiteral(resourceName: "SECONDARY LOGO 1 light background"),#imageLiteral(resourceName: "SECONDARY LOGO 2 dark background"),#imageLiteral(resourceName: "SECONDARY LOGO 2 light background"),#imageLiteral(resourceName: "SECONDARY LOGO 2 WHITE"),#imageLiteral(resourceName: "SECONDARY LOGO 2a dark background")]
    let herseyLogoSizes: [CGSize] = [CGSize(width: 144, height: 100),CGSize(width: 144, height: 100),CGSize(width: 144, height: 100),CGSize(width: 175, height: 100),CGSize(width: 175, height: 100),CGSize(width: 175, height: 100),CGSize(width: 175, height: 100)]
    let herseyStripes: [UIImage] = [#imageLiteral(resourceName: "stripes face"),#imageLiteral(resourceName: "STRIPES H"),#imageLiteral(resourceName: "STRIPES")]
    let herseyStripeSizes: [CGSize] = [CGSize(width: 180, height: 75),CGSize(width: 180, height: 75),CGSize(width: 180, height: 75)]
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #### Number of Sections in CollectionView #### //
        return 1
        
    }
    // collectionview number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #### Determin the Number of Components in the CollectionView #### //
        
        if collectionView.tag == 0 {
            return data.count
        } else if collectionView.tag == 1 {
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
    // collection view cellsforitem
    func collectionView(_ selectedCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let Cell = selectedCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        for subView in Cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        
       
         image = currentData[indexPath.row]

       
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

        Cell.contentView.addSubview(imageView)
        return Cell
       
}
    // collectionview creating an image
    
    func createImage(_ image:UIImage?, _ location:CGRect) {
        
        let imageView = ImageFile(image: image, From: self, frame: location, collectionViewSize: collectionView.frame)
        
        self.view.addSubview(imageView)
        
    }
   
    // collectionview selected items
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        createImage((currentData[indexPath.row]), CGRect(x: 500, y: 400, width: currentSizes[indexPath.row].width, height: currentSizes[indexPath.row].height))
      
        
        //next add methods to make image movable in app
    }
    
}


extension UIImage {
    
    var toData: Data? {
        //        var one = herseyHs[0].pngData()
        //        tempImage.image = UIImage(data:one! ,scale:1.0)
        return self.pngData()
    }
 
    
}



