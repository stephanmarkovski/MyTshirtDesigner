//
//  ImageFile.swift
//  MyTshirtDesigner
//
//  Created by Vincent Diliberto on 3/2/22.
//

import UIKit

class ImageFile: UIImageView {
    
    var from:UIViewController
    var lastLocation = CGPoint(x: 0, y: 0)
    var collectionViewRect:CGRect
    var lastScale:CGFloat
    var lastRotation: CGFloat = 0.0001
    var  advancedOn = false
    
    init(image: UIImage?, From :UIViewController, frame: CGRect, collectionViewSize: CGRect) {
        from = From
        collectionViewRect = collectionViewSize
        lastScale = 1
        super.init(image: image)
        
        self.frame = frame
        self.isUserInteractionEnabled = true
        
        self.center = CGPoint(x: 500, y: 500)
        self.lastLocation = self.center
        
        self.transform = CGAffineTransform(rotationAngle: lastRotation)
        
        let panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(detectPan))
        self.addGestureRecognizer(panRecognizer)
        
        let rotateRecognizer = UIRotationGestureRecognizer(target:self, action:#selector(detectRotate))
        self.addGestureRecognizer(rotateRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target:self, action:#selector(detectPinch))
        self.addGestureRecognizer(pinchRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target:self, action:#selector(detectLongPress))
        self.addGestureRecognizer(longPressRecognizer)
        
        self.gestureRecognizers = [panRecognizer, pinchRecognizer, longPressRecognizer, rotateRecognizer]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required convenience init(imageLiteralResourceName name: String) {
        fatalError("init(imageLiteralResourceName:) has not been implemented")
    }
    
    @objc func detectPan(_ gestureRecognizer:UIPanGestureRecognizer) {
        let translation  = gestureRecognizer.translation(in: self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
        if gestureRecognizer.state == .ended {
            if collectionViewRect.contains(gestureRecognizer.location(in: self.superview)){
                self.removeFromSuperview()
            }
        }
        
    }
    
    @objc func detectPinch(_ gestureRecognizer : UIPinchGestureRecognizer) {
        if gestureRecognizer.state == .began {
            gestureRecognizer.scale = lastScale
        }
        var transform:CGAffineTransform = CGAffineTransform(scaleX: gestureRecognizer.scale, y: gestureRecognizer.scale)
        transform = transform.rotated(by: lastRotation)
        self.transform = transform
        if gestureRecognizer.state == .ended {
            lastScale = gestureRecognizer.scale
        }
        
    }
    
    @objc func detectRotate(_ gestureRecognizer : UIRotationGestureRecognizer) {
        var originalRotation = CGFloat()
        if gestureRecognizer.state == .began {
            gestureRecognizer.rotation = lastRotation
            originalRotation = gestureRecognizer.rotation
        } else if gestureRecognizer.state == .changed {
            let newRotation = gestureRecognizer.rotation + originalRotation
            var transform:CGAffineTransform = CGAffineTransform(scaleX: lastScale, y: lastScale)
            transform = transform.rotated(by: newRotation)
            self.transform = transform
        } else if gestureRecognizer.state == .ended {
            lastRotation = gestureRecognizer.rotation
        }
    }
    
    @objc func detectLongPress(_ recognizer:UILongPressGestureRecognizer) {
        let textAlert = UIAlertController(title: "temp", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        textAlert.addAction(cancelAction)

        var addedLocationX = self.lastLocation.x
        var addedLocationY = self.lastLocation.y

        if (advancedOn){
            textAlert.addTextField { (textField) in
                textField.placeholder = "Type X Location"
                textField.text = "\(self.center.x)"
            }
        
            textAlert.addTextField { (textField) in
                textField.placeholder = "Type Y Location"
                textField.text = "\(self.center.y)"
            }
            
            textAlert.addTextField { (textField) in
                textField.placeholder = "Type Rotation"
                textField.text = "\(String(format: "%.4f", self.lastRotation))"
            }
        }
        
        let addAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default) { (action) in
            if (self.advancedOn){
                if let x = Double((textAlert.textFields?[0].text)!) {
                    addedLocationX = CGFloat(x)
                    self.center.x = addedLocationX
                }
            
                if let y = Double((textAlert.textFields?[1].text)!) {
                    addedLocationY = CGFloat(y)
                    self.center.y = addedLocationY
                }
            
                if let r = Double((textAlert.textFields?[2].text)!) {
                    self.transform = CGAffineTransform(rotationAngle: CGFloat(r + 0.000001))
                    self.lastRotation = CGFloat(r + 0.000001)
                }
            }
            self.lastLocation = self.center
        }
        textAlert.addAction(addAction)
        from.present(textAlert, animated: true, completion: nil)
            
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastLocation = self.center
    }
    
}
