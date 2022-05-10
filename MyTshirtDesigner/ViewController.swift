//
//  ViewController.swift
//  MyTshirtDesigner
//
//  Created by Stephan Markovski, Vincent Diliberto, Aiden Overton on 1/25/22.
//

import UIKit

class ViewController: UIViewController {

    var selectedImageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGestureRecognizer()
    }
    
    func addPanGestureRecognizer() {
           let pan = UIPanGestureRecognizer(target: self, action: #selector(moveImageView(_:)))
           self.view.addGestureRecognizer(pan)

}
    @objc func moveImageView(_ sender: UIPanGestureRecognizer) {
   
        // selectedImageView = huskyFaces.count

           guard let selectedImageView = selectedImageView else {
               return
    
    
}
        switch sender.state {
               case .changed, .ended:
                   selectedImageView.center = selectedImageView.center.offset(by: sender.translation(in: self.view))
                   sender.setTranslation(.zero, in: self.view)
               default:
                   break
        
        

        }
    

    }
}
extension CGPoint {
    func offset(by point: CGPoint) -> CGPoint {
        return CGPoint(x: self.x + point.x, y: self.y + point.y)
    }
}
