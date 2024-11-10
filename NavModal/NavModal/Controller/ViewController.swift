//
//  ViewController.swift
//  NavModal
//
//  Created by 김민준 on 11/10/24.
//

import UIKit

class ViewController: UIViewController {

    let button : UIButton = {
        let button = UIButton()
        button.setTitle("화면전환 ", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let button2 : UIButton = {
        let button = UIButton()
        button.setTitle("화면전환 nav ", for: .normal)
        button.backgroundColor = .black
        
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonClicked2), for: .touchUpInside)
        setUI()
        view.backgroundColor = .white
    }
    
    @objc func buttonClicked(){
        let vc = SecondViewController()
        //MARK: - 화면 전환 애니메이션
        vc.modalTransitionStyle = .coverVertical // 아래에서 위로 (기존)
//        vc.modalTransitionStyle = .crossDissolve // 화면이 부드럽게 페이드 인/아웃
//        vc.modalTransitionStyle = .flipHorizontal // 가로로 뒤집음
        
        //MARK: - 화면 표시 모드
        vc.modalPresentationStyle = .automatic // 자동으로
        vc.modalPresentationStyle = .fullScreen // 풀 스크린
        vc.modalPresentationStyle = .pageSheet //화면의 가운데에 배치되는 페이지 시트 (iPad나 가로 모드에서 주로 사용)
        vc.modalPresentationStyle = .formSheet // 화면 중앙에 나타나는 작은 폼 시트
        vc.modalPresentationStyle = .currentContext //현재 컨텍스트 위에 모달을 표시
        vc.modalPresentationStyle = .custom //사용자 정의 전환 스타일을 사용할 때
        vc.modalPresentationStyle = .overFullScreen //기존 화면이 투명하게 유지되면서 모달이 전체 화면을 덮음
        vc.modalPresentationStyle = .overCurrentContext  //현재 화면 위에 투명하게 오버레이하는 방식
        vc.modalPresentationStyle = .popover //팝오버 스타일
        
        // MARK: - 모달창 높이 조절
        vc.modalPresentationStyle = .pageSheet //화면의 가운데에 배치되는 페이지 시트 (iPad나 가로 모드에서 주로 사용)
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large(), .custom{ _ in 200}] // 중간 및 큰 높이 조절 포인트 지정
            sheet.prefersGrabberVisible = true    // 상단에 잡기 표시줄 추가
        }

        
        
        
        self.present(vc,animated: true)
    }
    
    @objc func buttonClicked2(){
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc , animated: true)
    }

    func setUI(){
        
        view.addSubview(button)
        view.addSubview(button2)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button.bottomAnchor , constant: 10),
        ])
    }

}

