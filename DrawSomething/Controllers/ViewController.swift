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
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)

        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)

        return button
    }()
    
    @objc fileprivate func handleUndo(){
        print("Undo lines drawn")
        canvas.undo()
    }
    
    @objc fileprivate func handleClear() {
        canvas.clear()
    }
    
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 20
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    override func loadView() {
        self.view = canvas
    }
    
    @objc fileprivate func handleColorChange(button: UIButton){
        canvas.setStrokeColor(color: button.backgroundColor ?? .black) // odd way to handle optional: if no color in background color, default to black
    }
    
    @objc fileprivate func handleSliderChange(){
        
        canvas.setStrokeWidth(width: slider.value)
    }
    
    fileprivate func setupLayout() {
        let colorStackView = UIStackView(arrangedSubviews: [
            yellowButton,
            redButton,
            blueButton
            ])
        colorStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            colorStackView,
            clearButton,
            slider
            ])
        
        stackView.distribution = .fillEqually // create stackView container that arranges items horizontall
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // overriding loadView makes following two lines unnecssaory
//        view.addSubview(canvas)
//        canvas.frame = view.frame
        canvas.backgroundColor = .white
        
        setupLayout()
        
        
    }


}

