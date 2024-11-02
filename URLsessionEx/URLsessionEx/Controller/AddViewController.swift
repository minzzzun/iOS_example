

import UIKit

class AddViewController : UIViewController {
    
    var viewController : ViewController?
    let apiService = APIService()
    
    var nameField : UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "이름을 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var partField : UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "파트를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var ageField : UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "나이를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        setUI()
    }
    
    @objc func addButtonClicked(){
        
        guard let name = nameField.text,
              let part = partField.text,
              let ageStr = ageField.text,
              let age = Int(ageStr)
        else { return }
        
        let user = MemberData(name: name, part: part, age: age)
        guard let viewController = viewController else {return}
        addMember(member: user , vc: viewController)
        dismiss(animated: true)
    }
    
    func setUI() {
        view.addSubview(nameField)
        view.addSubview(partField)
        view.addSubview(ageField)
        view.addSubview(addButton)
    
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            nameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10),
            nameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        
            partField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            partField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10),
            partField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                    
            ageField.topAnchor.constraint(equalTo: partField.bottomAnchor, constant: 20),
            ageField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10),
            ageField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -20),
            
            
        ])
        
    }
}

//MARK: - API
extension AddViewController {

    func addMember(member: MemberData , vc: ViewController) {
            apiService.postMemberData(member: member) { success in
                if success {
                    DispatchQueue.main.async {
                        vc.getData()
                        vc.tableView.reloadData()
                    }
                }
            }
        }
    
}
