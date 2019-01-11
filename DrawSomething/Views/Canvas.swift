//
//  Canvas.swift
//  DrawSomething
//
//  Created by DARRELL A PAYNE on 1/9/19.
//  Copyright © 2019 DARRELL A PAYNE. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    //    var line = [CGPoint]() // eliminate this in favor to two dimensional array
    fileprivate var lines = [Line]() 
    
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    
    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    func setStrokeWidth(width: Float){
        self.strokeWidth = width
    }
    
    func undo(){
        _ = lines.popLast() // Remove last line in array
        setNeedsDisplay() // redraw the screen
    }
    
    func clear() {
        
        lines.removeAll()
        setNeedsDisplay()
        
    }
    
    
    override func draw(_ rect: CGRect) {
        // Custom Drawing
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        // Setup lines to draw

        
        lines.forEach { (line) in
            
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
    }
    
    
    // Capture screen touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: [])) // Add Line struct to lines array
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}  // Use guard to avoid optional values (guard unwraps optional safely)
        //        print(point)
        
        guard var lastLine = lines.popLast() else { // Grab latest line array off lines array
            return
        }
        lastLine.points.append(point)  // Add point to it
        lines.append(lastLine) // Put it back
        
        setNeedsDisplay()
        
    }
}

