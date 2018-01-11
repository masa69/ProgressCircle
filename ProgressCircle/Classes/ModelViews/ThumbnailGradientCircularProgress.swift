
import GradientCircularProgress

class ThumbnailGradientCircularProgress: DefaultGradientCircularProgress {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        super.initView(style: ThumbnailStyleProperty(size: self.frame.width), display: false)
    }
    
    
    func start(duration: CGFloat) {
        self.duration = duration
        super.start()
    }
    
    
    override func stop() {
        super.stop()
    }
    
}

struct ThumbnailStyleProperty: StyleProperty {
    
    var progressSize: CGFloat = 0.0
    
    var arcLineWidth: CGFloat = 2.0
    
    var startArcColor: UIColor = UIColor.white
    
    var endArcColor: UIColor = UIColor.white
    
    var baseLineWidth: CGFloat? = 1.6
    
    var baseArcColor: UIColor? = UIColor.black
    
    var ratioLabelFont: UIFont?
    
    var ratioLabelFontColor: UIColor?
    
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
