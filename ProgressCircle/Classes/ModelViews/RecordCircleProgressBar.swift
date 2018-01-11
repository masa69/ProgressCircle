
import CircleProgressBar

class RecordCircleProgressBar: DefaultCircleProgressBar {
    
    private var isRecording: Bool = false
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        super.duration = 5.0
        
        self.progressBarWidth = 4.0
        self.progressBarProgressColor = UIColor.blue
        self.progressBarTrackColor = UIColor.clear
        self.startAngle = 270.0
        
        self.hintHidden = false
        self.hintViewSpacing = 10.0
        self.hintTextColor = UIColor.gray
        self.hintViewBackgroundColor = UIColor.clear
        self.hintTextFont = UIFont.systemFont(ofSize: 23.0, weight: .ultraLight)
    }
    
    
    override func start() {
        super.start()
    }
    
    
    override func stop() {
        super.stop()
    }
    
}
