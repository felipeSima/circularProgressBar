//
//  ViewController.swift
//  circularProgressBar
//
//  Created by Felipe Silva Lima on 3/29/19.
//  Copyright © 2019 Felipe Silva Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let rectangule = CGRect()
    //var incTap : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initializing circle Shape
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let rectangularPath = UIBezierPath(rect: rectangule)
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        
        layerProperties(layer: trackLayer, path: circularPath)
        //layerProperties(layer: trackLayer, path: rectangularPath)
        
        shapeLayer.strokeEnd = 0
        
        shapeLayer.strokeColor = UIColor.red.cgColor

        layerProperties(layer: shapeLayer, path: circularPath)

        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc private func handleTap() {
        
        //incTap += 0.1
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        //basicAnimation.toValue = incTap
        basicAnimation.toValue = 1
        
        //print(incTap)
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        //rectangule.add(basicAnimation, forKey: "urSoBasic")
        
    }
    
    func layerProperties(layer : CAShapeLayer, path : UIBezierPath) {

        layer.lineWidth = 10

        layer.fillColor = UIColor.clear.cgColor

        layer.lineCap = CAShapeLayerLineCap.round

        layer.path = path.cgPath

        view.layer.addSublayer(layer)

    }

}

