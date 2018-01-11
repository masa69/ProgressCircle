
import CircleProgressBar

class ThumbnailCircleProgressBar: DefaultCircleProgressBar {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.progressBarWidth = 2.0
        self.progressBarProgressColor = UIColor.white
        self.progressBarTrackColor = UIColor.black
        self.startAngle = 270.0
        
        self.hintHidden = true
    }
    
    
    func start(duration: CGFloat) {
        self.duration = duration
        super.start()
    }
    
    
    override func stop() {
        super.stop()
    }

}
