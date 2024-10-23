

import UIKit

class ViewController : UIViewController {
    var imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return  image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        loadAsyncImage()
      
    }
    

    func setupImageView() {
          view.addSubview(imageView)
          NSLayoutConstraint.activate([
              imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
              imageView.widthAnchor.constraint(equalToConstant: 300),
              imageView.heightAnchor.constraint(equalToConstant: 300)
          ])
      }
    
    func loadAsyncImage(){
        // 1. 안전하게 url 언래핑
        guard let url =  URL(string: "https://cdn.pixabay.com/photo/2016/04/17/10/38/doberman-1334497_960_720.jpg")else {
            print("🚨 잘못된 url")
            return
        }
        
        // 2. 비동기 네트워크 요청
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // 3. 데이터와 오류 확인
                    guard let self,
                          let data = data,
                          response != nil,
                          error == nil else { return }
            
            // 4. 메인 스레드에서 UI 업데이트
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data) ?? UIImage()
                        print("✅ 이미지 불러옴")
                    }
            
                }.resume() // 5. 요청 시작 
    }
    
}
