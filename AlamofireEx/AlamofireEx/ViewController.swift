//
//  ViewController.swift
//  AlamofireEx
//
//  Created by 김민준 on 12/22/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // POST 요청 보내기
        postRequest()
    }

    func postRequest() {
        // POST 요청을 보낼 URL
        let url = "https://67682970cbf3d7cefd37398c.mockapi.io/User"
        // 전송할 파라미터
        let parameters = ["uid": "123456"]
        // POST 요청 보내기
        AF.request(url,
                  method: .post,
                  parameters: parameters,
                  encoding: JSONEncoding.default,
                  headers: ["Content-Type": "application/json"])
        .validate()
        .responseDecodable(of: ResponseModel.self) { response in
            switch response.result {
            case .success(let value):
                print("성공: \(value)")
            case .failure(let error):
                print("에러: \(error.localizedDescription)")
            }
        }
    }

}

// 서버 응답을 처리할 모델
struct ResponseModel: Codable {
    let uid : String
}

