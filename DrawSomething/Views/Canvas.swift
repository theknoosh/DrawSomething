//
//  Canvas.swift
//  DrawSomething
//
//  Created by DARRELL A PAYNE on 1/9/19.
//  Copyright © 2019 DARRELL A PAYNE. All rights reserved.
//

import UIKit

class Canvas: UIView {
    override func draw(_ rect: CGRect) {
        // Custom Drawing
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        // Setup lines to draw
        
        //        let startPoint = CGPoint(x: 0, y: 50)
        //        let endPoint = CGPoint(x: 100, y: 100)
        //
        //        context.move(to: startPoint)
        //        context.addLine(to: endPoint)
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(5)
        
        lines.forEach {(line) in
            for (i,p) in line.enumerated(){
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
        
    }
    //    var line = [CGPoint]() // eliminate this in favor to two dimensional array
    var lines = [[CGPoint]]() // Two dimensional array
    
    
    // Capture screen touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]()) // Add line array to lines array
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}  // Use guard to avoid optional values (guard unwraps optional safely)
        //        print(point)
        
        guard var lastLine = lines.popLast() else { // Grab latest line array off lines array
            return
        }
        lastLine.append(point)  // Add point to it
        lines.append(lastLine) // Put it back
        
        setNeedsDisplay()
        
    }
}

