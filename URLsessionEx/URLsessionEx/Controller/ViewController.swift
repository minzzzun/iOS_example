

import UIKit

class ViewController: UIViewController {

    var member : [MemberData] = []
    let apiService = APIService()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Url Session"
        label.font = UIFont.systemFont(ofSize: 22 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTable()
        clickedButton()
        getData()
        
    }
    
    
    func clickedButton(){
        addButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton(){
        let vc = AddViewController()
        vc.viewController = self
        self.present(vc, animated: true)
        
    }
    
    func setTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
    }

    func setUI(){
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -20),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }

}

//MARK: - TableView Extension
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" , for : indexPath) as? TableViewCell else { return UITableViewCell() }

        let memberCell = member[indexPath.row]
        cell.partLabel.text = memberCell.part
        cell.nameLabel.text = memberCell.name
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        let passData = member[indexPath.row]
        
        vc.member = passData
        vc.viewcontroller = self
        self.present(vc,animated: true)
    }
    
}


//MARK: - API 
extension ViewController {
    
    func getData() {
        apiService.fetchMembers { [weak self] members in
                    DispatchQueue.main.async {
                        if let members = members {
                            self?.member = members
                            self?.tableView.reloadData()
                        }
                    }
                }
    }
    
    
}
