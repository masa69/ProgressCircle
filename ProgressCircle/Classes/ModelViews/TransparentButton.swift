
import UIKit

class TransparentButton: DefaultButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitle("", for: .normal)
        self.backgroundColor = UIColor.clear
    }
}
