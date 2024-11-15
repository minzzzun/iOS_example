

import UIKit

class ViewController: UIViewController {
    
    var mem : Model = Model(name: "안녕")
    let viewControllers = [HomeViewController(), SearchViewController(), ProfileViewController()]
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 50)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollection()
        setUI()
        switchToViewController(at: 0)
    }
    
    func setCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setUI(){
        view.addSubview(collectionView)
        view.backgroundColor = .white
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 50),
            
            containerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func switchToViewController(at index: Int) {
        // 기존 자식 ViewController 제거
        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        // 새 ViewController 추가
        let selectedViewController = viewControllers[index]
        addChild(selectedViewController)
        selectedViewController.view.frame = containerView.bounds
        containerView.addSubview(selectedViewController.view)
        selectedViewController.didMove(toParent: self)
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.cellLabel.text = mem.name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else {
            return
        }
        //        let selectedViewController = viewControllers[indexPath.item]
        //        selectedViewController.modalPresentationStyle = . automatic
        //        selectedViewController.modalTransitionStyle = .flipHorizontal
        //        self.present(selectedViewController, animated: true, completion: nil)
        switchToViewController(at: indexPath.item)
        
        cell.backgroundColor = .red
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let deselectedCell = collectionView.cellForItem(at: indexPath) {
            deselectedCell.backgroundColor = .white
        }
    }
}
