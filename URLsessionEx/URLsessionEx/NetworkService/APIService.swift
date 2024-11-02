
import Foundation

class APIService {
    private let baseURL = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"

    
    //MARK: - GET 
    func fetchMembers(completion: @escaping ([MemberData]?) -> Void) {
            guard let url = URL(string: "\(baseURL)/user?part=all") else {
                print("🚨 Invalid URL")
                completion(nil)
                return
            }
            
            NetworkManager.shared.requestData(url: url, method: "GET") { data, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                do {
                    let members = try JSONDecoder().decode([MemberData].self, from: data)
                    completion(members)
                } catch {
                    print("Decoding error: \(error)")
                    completion(nil)
                }
            }
        }

    //MARK: - POST
    func postMemberData(member: MemberData, completion: @escaping (Bool) -> Void) {
            guard let url = URL(string: "\(baseURL)/user") else {
                print("🚨 Invalid URL")
                completion(false)
                return
            }
            
            do {
                let jsonData = try JSONEncoder().encode(member)
                NetworkManager.shared.requestData(url: url, method: "POST", body: jsonData) { data, error in
                    if let error = error {
                        print("🚨 Error: \(error.localizedDescription)")
                        completion(false)
                        return
                    }
                    
                    if let data = data {
                        print("✅ Response: \(String(decoding: data, as: Unicode.UTF8.self))")
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            } catch {
                print("Encoding error: \(error)")
                completion(false)
            }
        }
        
    
    //MARK: - PATCH
    func patchMemberData(memberID: Int , member: MemberData, completion: @escaping (Bool) -> Void) {
          guard let url = URL(string: "\(baseURL)/user/\(memberID)") else {
              print("🚨 Invalid URL")
              
              completion(false)
              return
          }
          
          do {
              let jsonData = try JSONEncoder().encode(member)
              NetworkManager.shared.requestData(url: url, method: "PATCH", body: jsonData) { data, error in
                  if let error = error {
                      print("🚨 Error: \(error.localizedDescription)")
                      completion(false)
                      return
                  }
                  print("patch 성공")
                  completion(true)
              }
          } catch {
              print("Encoding error: \(error)")
              completion(false)
          }
      }
    
    //MARK: - DELETE
    func deleteMember(id: Int , completion: @escaping (Bool) -> Void) {
          guard let url = URL(string: "\(baseURL)/user/\(id)") else {
              print("🚨 Invalid URL")
              completion(false)
              return
          }
          
          NetworkManager.shared.requestData(url: url, method: "DELETE") { data, error in
              if let error = error {
                  print("🚨 Error: \(error.localizedDescription)")
                  completion(false)
                  return
              }
              
              completion(true)
          }
      }
}
