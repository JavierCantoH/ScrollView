//
//  ViewController.swift
//  TestScroll
//
//  Created by Luis Javier Canto Hurtado on 23/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.axis = .horizontal
        return stack
    }()
    
    var scrollView: UIScrollView = {
        var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        // respect safe area
        let safeG = view.safeAreaLayoutGuide
        
        // use scrollView's Content Layout Guide to define scrollable content
        let layoutG = scrollView.contentLayoutGuide
        
        // use scrollView's Frame Layout Guide to define content height (since you want horizontal scrolling)
        let frameG = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            // respect safeArea
            scrollView.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 100),
            scrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: -10.0),
            
            stackView.topAnchor.constraint(equalTo: layoutG.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutG.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutG.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: layoutG.trailingAnchor, constant: -10.0),
            
            stackView.heightAnchor.constraint(equalTo: frameG.heightAnchor),
        ])
        
        // add some views to the stack view
        let arr: [UIColor] = [.red, .green, .blue, .yellow, .purple,]
        
        for i in 0..<arr.count {
            let contentView = UIView()
            contentView.backgroundColor = arr[i]
            stackView.addArrangedSubview(contentView)
            // constrain each "contentView" width to scrollView's Frame Layout Guide width minus 20
            contentView.widthAnchor.constraint(equalTo: frameG.widthAnchor, constant: -20).isActive = true
        }
    }
}

