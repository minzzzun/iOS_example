import UIKit

class ViewController : UIViewController {
    private let circleLayer = CAShapeLayer()
    private let animationDuration: TimeInterval = 10 // 타이머 지속 시간 (초)set
    let button : UIButton = {
        let button = UIButton()
        button.setTitle("10초 시작", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.orange, for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButton()
       
    }
    
    func setButton(){
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc func buttonClicked(){
        setupCircularTimer()
        startTimerAnimation()
    }
    

    private func setupCircularTimer() {
        let center = view.center
        let radius: CGFloat = 100
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: -CGFloat.pi / 2,
            endAngle: 3 * CGFloat.pi / 2,
            clockwise: true
        )
        
        // 배경 원
        let backgroundCircle = CAShapeLayer()
        backgroundCircle.path = circularPath.cgPath
        backgroundCircle.strokeColor = UIColor.lightGray.cgColor
        backgroundCircle.fillColor = UIColor.clear.cgColor
        backgroundCircle.lineWidth = 10
        view.layer.addSublayer(backgroundCircle)
        
        // 애니메이션 원
        circleLayer.path = circularPath.cgPath
        circleLayer.strokeColor = UIColor.orange.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = 10
        circleLayer.strokeEnd = 1
        view.layer.addSublayer(circleLayer)
    }

    private func startTimerAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0
        animation.duration = animationDuration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        circleLayer.add(animation, forKey: "timerAnimation")
    }
}

