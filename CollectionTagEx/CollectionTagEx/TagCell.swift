import UIKit

class TagCell : UICollectionViewCell {

    let cellLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("StroyBoard 사용 X")
    }
    
    func setUI(){
        contentView.addSubview(cellLabel)
       
        NSLayoutConstraint.activate([
            
            cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
        
    }
    
    
    
    
}





