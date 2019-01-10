//
//  ViewController.swift
//  DrawSomething
//
//  Created by DARRELL A PAYNE on 1/7/19.
//  Copyright © 2019 DARRELL A PAYNE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.frame = view.frame
        canvas.backgroundColor = .white
    }


}

