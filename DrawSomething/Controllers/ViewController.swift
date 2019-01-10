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
    
    override func loadView() {
        self.view = canvas
    }
    
    fileprivate func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
            ])
        
        stackView.distribution = .fillEqually // create stackView container that arranges items horizontall
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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

