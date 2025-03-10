

import UIKit

class CustomView : UIView {
    
    let miniView : DetailView = {
        let view = DetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        self.backgroundColor = .yellow
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI(){
        self.addSubview(miniView)
        
        NSLayoutConstraint.activate([
            miniView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            miniView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            miniView.widthAnchor.constraint(equalToConstant: 50),
            miniView.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
