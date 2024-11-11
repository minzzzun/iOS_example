
import UIKit

class ViewController: UIViewController {

    var mem : Model = Model(title: "테이블뷰")
    
    let table : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        setUI()
    
    }
    
    func setTable(){
        table.dataSource = self
        table.delegate = self
        table.register(TableViewCell.self, forCellReuseIdentifier: "table")
    }
    
    func setUI(){
        view.addSubview(table)
        
        
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}



extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath) as?
                TableViewCell
        else { return UITableViewCell() }
        cell.label.text = mem.title
    
        return cell
    }
    
    
    
}
