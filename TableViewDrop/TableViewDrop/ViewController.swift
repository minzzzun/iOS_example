import UIKit

class ViewController: UIViewController {
    
    var data : [String] = ["김민준","김기영","전소명","유재혁","김현중"]
    let tableView : UITableView = {
        let view = UITableView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setTable()
    }

    func setUI(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func setTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.dragDelegate = self // Drag 활성화
        tableView.dropDelegate = self // Drop 활성화
        
        tableView.dragInteractionEnabled = true // iOS 11 이상에서 반드시 설정 필요

        tableView.register(TableViewCell.self, forCellReuseIdentifier: "table")
    }

}

//MARK: - table

extension ViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.cellLabel.text = data[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

//MARK: - drag
extension ViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let draggedData = data[indexPath.row]
        let itemProvider = NSItemProvider(object: draggedData as NSString)
        return [UIDragItem(itemProvider: itemProvider)]
    }
}

//MARK: - drop
extension ViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath else { return }
        
        for item in coordinator.items {
            if let sourceIndexPath = item.sourceIndexPath {
                // 같은 테이블 내에서 드래그 앤 드롭 (Reordering)
                tableView.performBatchUpdates {
                    // 데이터 이동
                    let movedItem = data.remove(at: sourceIndexPath.row)
                    data.insert(movedItem, at: destinationIndexPath.row)
                    
                    // 셀 이동
                    tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
                }
                coordinator.drop(item.dragItem, toRowAt: destinationIndexPath)
            }
        }
    }

    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        // 드래그된 데이터 타입을 NSString으로 제한
        return session.canLoadObjects(ofClass: NSString.self)
    }

    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        // 같은 테이블 내 드롭 시 move 동작으로 설정
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
}
