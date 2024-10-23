//
//  ViewController.swift
//  notificationExample
//
//  Created by 김민준 on 10/5/24.
//

import UIKit

extension  Notification.Name{
    static let myNotification = Notification.Name("myNotification")
}

class ViewController: UIViewController {
    let Label : UILabel = {
        let label = UILabel()
        label.text = "버튼 눌러보세요"
        label.frame = CGRect(x: 100, y: 200, width: 200, height: 40)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let button : UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 40))
        
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(Label)
        view.addSubview(button)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: .myNotification, object: nil)
        
    }

   
    
    @objc func buttonClicked(){
        NotificationCenter.default.post(name: .myNotification, object: nil)
        
    }
    
    @objc func handleNotification(){
        Label.text = "받음"
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}



