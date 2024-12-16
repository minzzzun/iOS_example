import UIKit

class ViewController: UIViewController {
    
    let data : [String] = ["쿠앤크","메로나","아몬드 빼빼로","콘칩","나쵸","꼬깔콘","빙그레 바나나","액셀런트","더위사냥","꿀꽈배기","버터와플","새우칩","스프링클","하리보","새콤달콤","푸딩","에이스","홈런볼","바밤바","허쉬","ABC 초콜릿"]
    let tagCollectionView : UICollectionView = {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 100, height: 60)
        collectionViewLayout.minimumLineSpacing = 20
        collectionViewLayout.minimumInteritemSpacing = 10 // 열 간 간격

        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // 배경 설정
        setUI()
        setCollection()
    }
    
    func setUI(){
        view.addSubview(tagCollectionView)
        
        NSLayoutConstraint.activate([
            tagCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,
                                                   constant: 60),
            tagCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                       constant: 60),
            tagCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tagCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    
    func setCollection(){
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        tagCollectionView.register(TagCell.self, forCellWithReuseIdentifier: "TagCell")
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as? TagCell else {return UICollectionViewCell()}
        
        cell.cellLabel.text = data[indexPath.row]
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
    
}
