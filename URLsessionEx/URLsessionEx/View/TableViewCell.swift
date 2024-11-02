

import UIKit


class TableViewCell : UITableViewCell {
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let partLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TableViewCell")
        setUI()
    }
    
    
    func setUI(){
        contentView.addSubview(partLabel)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            partLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            partLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: partLabel.trailingAnchor , constant: 20),
            
        ])
        
    }
}


