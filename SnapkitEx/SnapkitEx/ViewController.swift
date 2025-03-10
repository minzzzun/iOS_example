
import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let myLabel = UILabel().then {
        $0.text = "Hello world!"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textAlignment = .center
    }
    
    let myButton = UIButton(type: .system).then {
        $0.setTitle("Press Me", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
    }
    
    //MARK: - 메인
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setUI()
    }
    
    func setUI(){
        view.addSubview(myLabel)
        view.addSubview(myButton)
        
        myLabel.snp.makeConstraints { make in
            make.center.equalToSuperview() //부모 뷰의 중심 X에 위치
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50) //안전 영역 기준 50pt 아래 
            make.width.lessThanOrEqualTo(300)
        }
        
        myButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(myLabel.snp.bottom).offset(20)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
    }

}
//MARK: - <#구역이름#>
exte
