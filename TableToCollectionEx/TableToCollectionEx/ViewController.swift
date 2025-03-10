import UIKit

class ViewController: UIViewController {

    var tableViewData: [String] = ["Apple", "Banana", "Cherry", "Date"]
    var collectionViewData: [String] = []

    let tableView = UITableView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Setup TableView
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 2)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        view.addSubview(tableView)

        // Setup CollectionView
        collectionView.frame = CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.dropDelegate = self
        view.addSubview(collectionView)
    }
}

// MARK: - UITableView DataSource and DragDelegate
extension ViewController: UITableViewDataSource, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = tableViewData[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = tableViewData[indexPath.row]
        let itemProvider = NSItemProvider(object: item as NSString)
        return [UIDragItem(itemProvider: itemProvider)]
    }
}

// MARK: - UICollectionView DataSource and DropDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.backgroundColor = .lightGray

        // Add Label to Cell
        let label = UILabel(frame: cell.contentView.bounds)
        label.text = collectionViewData[indexPath.row]
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        cell.contentView.addSubview(label)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        for item in coordinator.items {
            if let itemProvider = item.dragItem.itemProvider.copy() as? NSItemProvider {
                itemProvider.loadObject(ofClass: NSString.self) { [weak self] (object, error) in
                    guard let self = self else { return }
                    if let string = object as? String {
                        DispatchQueue.main.async {
                            self.collectionViewData.append(string)
                            self.collectionView.reloadData()
                        }
                    }
                }
            }
        }
    }
}

