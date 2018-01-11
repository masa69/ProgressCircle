
import UIKit

class LicenceTextView: UITextView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.text = ""
        
        // Licences/ 以下を読み込む
        let texts: [String] = [
            "CircleProgressBar",
            "GradientCircularProgress",
        ]
        
        for (i, fileName) in texts.enumerated() {
            if let path = Bundle.main.path(forResource: fileName, ofType: "txt") {
                if let data = NSData(contentsOfFile: path) {
                    if let text: String = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue) as String? {
                        if i > 0  && self.text != "" {
                            self.text = self.text + "\n\n\n\n\n\n\n\n\n\n" + fileName + "\n\n" + text
                            continue
                        }
                        self.text = fileName + "\n\n" + text
                    }
                }
            }
        }
        // 入力不可にする
        self.isEditable = false
    }
}
