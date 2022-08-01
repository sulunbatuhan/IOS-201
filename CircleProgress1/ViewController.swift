//
//  ViewController.swift
//  CircleProgress1
//
//  Created by batuhan on 26.07.2022.
//

import UIKit

class ViewController: UIViewController {
   
    
    let circleLayer = CAShapeLayer()
    let lblText : UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat((Float.pi)), clockwise: true)
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 10
        circleLayer.strokeEnd = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        
        lblText.text = "Başlat"
        
        lblText.textColor = UIColor.black
        lblText.font = UIFont.boldSystemFont(ofSize: 20)
        lblText.textAlignment = .center
        lblText.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        lblText.center = view.center
        
        view.layer.addSublayer(circleLayer)
        view.addSubview(lblText)
       
    }

    
    
    // MARK: GestureRecognizer
    @objc func tap(){
        Animate()
        print("tap")
    }
    
    func Animate(){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        
        circleLayer.add(animation, forKey: "animation")
        
    }
    
    
     
  
    

}

