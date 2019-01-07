//
//  ViewController.swift
//  DrawSomething
//
//  Created by DARRELL A PAYNE on 1/7/19.
//  Copyright © 2019 DARRELL A PAYNE. All rights reserved.
//

import UIKit

class Canvas: UIView {
    override func draw(_ rect: CGRect) {
        // Custom Drawing
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        // Setup lines to draw
        
        let startPoint = CGPoint(x: 0, y: 50)
        let endPoint = CGPoint(x: 100, y: 100)
        
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        
        
        context.strokePath()
        
    }
    
    // Capture screen touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
}

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.frame = view.frame
        canvas.backgroundColor = .white
    }


}

