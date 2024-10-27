
import UIKit

class GetData : UIViewController {
    
    let urlLink : String = "d"
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    //MARK: - GET 함수 구현
    func getData(){
        if let url = URL(string: urlLink){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("🚨\(error!)")
                    return
                }
                
                if let JSONData = data {
                    let dataString = String(data: JSONData, encoding: .utf8)
                    print ("\(dataString!)")
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode([Data].self, from: JSONData)
                        print("\(decodeData)")
                    }
                
                }
                
            }
            
        }
    } // 함수 끝
}
