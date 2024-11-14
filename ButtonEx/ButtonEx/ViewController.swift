

import UIKit

class ViewController : UIViewController {
    
    
    //    let horizontalButton: UIButton = {
    //        let button = UIButton(configuration: UIButton.Configuration.filled())
    //        button.configuration?.title = "Horizontal Button"
    //        button.configuration?.image = UIImage(systemName: "star")
    //        button.configuration?.imagePlacement = .leading
    //        button.configuration?.imagePadding = 8
    //        button.backgroundColor = .gray
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        return button
    //    }()
    //
    //    // 이미지가 위에 있는 버튼
    //    let verticalButton: UIButton = {
    //        let button = UIButton(configuration: UIButton.Configuration.filled())
    //        button.configuration?.title = "Vertical Button"
    //        button.configuration?.image = UIImage(systemName: "star.fill")
    //        button.configuration?.imagePlacement = .top
    //        button.configuration?.imagePadding = 8
    //        button.backgroundColor = .gray
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        return button
    //    }()
    //
    //    // 이미지가 없는 텍스트 버튼
    //    let textOnlyButton: UIButton = {
    //        let button = UIButton(configuration: UIButton.Configuration.filled())
    //        button.configuration?.title = "Text Only Button"
    //        button.backgroundColor = .gray
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        return button
    //    }()
    
    
    
    
    //MARK: - 다른 버전
    let horizontalButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("Horizontal Button", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
            .foregroundColor: UIColor.black
        ]))
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 26, bottom: 12, trailing: 26)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 이미지가 위에 있는 버튼
    let verticalButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("Vertical Button", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
            .foregroundColor: UIColor.black
        ]))
        config.image = UIImage(systemName: "star.fill")
        config.imagePlacement = .top
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 26, bottom: 12, trailing: 26)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 텍스트만 있는 버튼
    let textOnlyButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("Text Only Button", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
            .foregroundColor: UIColor.black
        ]))
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 26, bottom: 12, trailing: 26)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setUI()
    }
    
    func setUI(){
        view.addSubview(horizontalButton)
        view.addSubview(verticalButton)
        view.addSubview(textOnlyButton)
        
        NSLayoutConstraint.activate([
            horizontalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            verticalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalButton.topAnchor.constraint(equalTo: horizontalButton.bottomAnchor, constant: 20),
            
            textOnlyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textOnlyButton.topAnchor.constraint(equalTo: verticalButton.bottomAnchor, constant: 20),
        ])
    }
}


