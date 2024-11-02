
import UIKit

class DetailViewController : UIViewController {

    var member : MemberData?
    let apiService = APIService()
    var viewcontroller : ViewController?
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    let partLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let deleteButton : UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.tintColor = .red
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editButton : UIButton = {
        let button = UIButton() 
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setValue()
        setUI()
        deleteButton.addTarget(self, action: #selector(deleteMember), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editMember), for: .touchUpInside)
       
    }
    
    
    
    func setValue(){
        guard let member = member else {return}
        print(member)
        nameLabel.text = member.name
        partLabel.text = "part: \(member.part)"
        ageLabel.text = "age : \(String(member.age))"
    }
    
    func setUI() {
        view.addSubview(nameLabel)
        view.addSubview(partLabel)
        view.addSubview(ageLabel)
        view.addSubview(deleteButton)
        view.addSubview(editButton)
    
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            deleteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            partLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 20),
            partLabel.bottomAnchor.constraint(equalTo: ageLabel.topAnchor, constant: -20),
            
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
        ])
    }
    
    
    //MARK: - API
    @objc func deleteMember(){
        
        let alertController = UIAlertController(title: "Delete Member", message: "Are you sure you want to delete this member?", preferredStyle: .alert)

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            guard let memberID = self.member?.id else { return }  // member의 ID를 가져옵니다.
            guard let vc = self.viewcontroller else { return }
            self.apiService.deleteMember(id: memberID) { success in
                if success {
                
                    DispatchQueue.main.async {
                        print(memberID)
                        print("✅ Member deleted successfully")
                        vc.getData()
                        vc.tableView.reloadData()
                        self.dismiss(animated: true)
                    }
                } else {
                    print("🚨 Failed to delete member")
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           
           alertController.addAction(deleteAction)
           alertController.addAction(cancelAction)
           
        present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func editMember(){
        guard let member = member else { return }
               
               let alertController = UIAlertController(title: "Edit Member", message: "Update the member's information", preferredStyle: .alert)
               
               alertController.addTextField { textField in
                   textField.text = member.name
                   textField.placeholder = "Name"
               }
               
               alertController.addTextField { textField in
                   textField.text = member.part
                   textField.placeholder = "Part"
               }
               
               alertController.addTextField { textField in
                   textField.text = String(member.age)
                   textField.placeholder = "Age"
                   textField.keyboardType = .numberPad
               }
               
               let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
                   guard
                       let name = alertController.textFields?[0].text,
                       let part = alertController.textFields?[1].text,
                       let ageText = alertController.textFields?[2].text,
                       let age = Int(ageText)
                   else {
                       print("🚨 Invalid input")
                       return
                   }
                   
                   guard let memberID = member.id else { return }
                   print(memberID)
                   guard let vc = self.viewcontroller else { return }
                   
                   let updatedMember = MemberData(id : memberID, name: name, part: part, age: age)
                   
                   self.apiService.patchMemberData(memberID: memberID, member: updatedMember) { success in
                       if success {
                           DispatchQueue.main.async {
                               print("✅ Member updated successfully")
                               self.member = updatedMember
                               vc.getData()
                               vc.tableView.reloadData()
                               self.dismiss(animated: true, completion: nil)

                           }
                       } else {
                           print("🚨 Failed to update member")
                       }
                   }
               }
               
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               
               alertController.addAction(saveAction)
               alertController.addAction(cancelAction)
               
               present(alertController, animated: true, completion: nil)

    }
}


