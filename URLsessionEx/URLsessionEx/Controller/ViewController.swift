//
//  ViewController.swift
//  URLSessionEx
//
//  Created by 김민준 on 11/1/24.
//

import UIKit

class ViewController: UIViewController {

    let apiservice = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getData(){
        apiservice.getData { [weak self] members in
            DispatchQueue.main.async{
                if let members = members {
                    print(members)
                    // 비동기 작업 수행
                }
            }
            
        }
    }
    
    func addMember(member: MemberData , vc: ViewController) {
            apiService.postMemberData(member: member) { success in
                if success {
                    DispatchQueue.main.async {
                       //비동기 작업 수행 
                    }
                }
            }
        }

}

