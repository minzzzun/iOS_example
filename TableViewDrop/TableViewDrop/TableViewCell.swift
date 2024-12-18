import UIKit

class TableViewCell : UITableViewCell   {
    let cellLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "table")
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatalError")
    }
    
    func setUI(){
        contentView.addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
            
    }
}


