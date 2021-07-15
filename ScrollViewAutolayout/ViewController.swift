//
//  ViewController.swift
//  ScrollViewAutolayout
//
//  Created by Ankit on 15/07/21.
//  Copyright © 2021 Ankit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .magenta
        return scrollView
    }()
    
    let containerView : UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let label : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let dummyColorView : UIView = {
           let view = UIView(frame: .zero)
           view.translatesAutoresizingMaskIntoConstraints = false
           view.backgroundColor = .yellow
           return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(label)
        containerView.addSubview(dummyColorView)
        
        let scrollcontraints = [scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)]
        
        let heightContraint = containerView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor)
        heightContraint.priority = UILayoutPriority(250)
        let parentConstraints = [scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),containerView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor,multiplier: 1.0),heightContraint]
        
        let labelContraints = [label.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor),label.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor),label.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor)]
        label.text = "Here scroll view is inside view of safeaream, and container view is added to avoid scrollview ambigous height.To demonstate scroll we have placed view below the label after some spacing"
        
        let viewContraints = [dummyColorView.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 900.0),dummyColorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),dummyColorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),dummyColorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -80),dummyColorView.heightAnchor.constraint(equalToConstant: 65.0)]
    
        NSLayoutConstraint.activate(scrollcontraints + parentConstraints + labelContraints + viewContraints)
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }


}

