
import GradientCircularProgress

class RecordGradientCircularProgress: DefaultGradientCircularProgress {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        super.duration = 5.0
        super.initView(style: RecordStyleProperty(size: self.frame.width), display: true)
    }
}

struct RecordStyleProperty: StyleProperty {
    
    var progressSize: CGFloat = 0.0
    
    var arcLineWidth: CGFloat = 4.0
    
    var startArcColor: UIColor = UIColor.blue
    
    var endArcColor: UIColor = UIColor.red
    
    var baseLineWidth: CGFloat? = 4.0
    
    var baseArcColor: UIColor? = UIColor.clear
    
    var ratioLabelFont: UIFont? = UIFont.systemFont(ofSize: 23.0, weight: .ultraLight)
    
    var ratioLabelFontColor: UIColor? = UIColor.gray
    
    var messageLabelFont: UIFont?
    
    var messageLabelFontColor: UIColor?
    
    var backgroundStyle: BackgroundStyles = .none
    
    var dismissTimeInterval: Double?
    
    
    init() {
        
    }
    
    
    init(size: CGFloat) {
        self.progressSize = size
    }
    
}
