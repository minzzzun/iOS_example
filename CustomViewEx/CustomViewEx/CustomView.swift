

import UIKit

class CustomView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
