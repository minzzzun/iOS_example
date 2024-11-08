
import UIKit

class ViewController: UIViewController {
    
    let blueButton : UIButton = {
        let button = UIButton()
        button.setTitle("파란색으로 ", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        setUI()
        //MARK: - 3. 수신하기
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: .myNotification, object: nil)
    }
    
    
    // MARK: - 2 알림 보내기
    @objc func buttonClicked(){
        NotificationCenter.default.post(name: .myNotification, object: nil)
    }
    //MARK: - 3_1 수신해서 작업 수행
    @objc func handleNotification() {
        view.backgroundColor = .blue
    }
    //MARK: - 4. 제거하기
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func setUI(){
        view.addSubview(blueButton)
        
        NSLayoutConstraint.activate([
            blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blueButton.widthAnchor.constraint(equalToConstant: 200),
            blueButton.heightAnchor.constraint(equalToConstant: 40),
            
            
        ])
        
    }

}

// MARK: - 1. notification name 지정하기

extension Notification.Name {
    static let myNotification = Notification.Name("myNotification")
    
    
}

