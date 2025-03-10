//
//  ViewController.swift
//  CustomViewEx
//
//  Created by 김민준 on 10/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    let boxView : CustomView = {
        let view = CustomView()
        view.backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        view.backgroundColor = .white
    }

    func setUI(){
        view.addSubview(boxView)
        
        NSLayoutConstraint.activate([
            boxView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boxView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            boxView.widthAnchor.constraint(equalToConstant: 200),
            boxView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }

}

