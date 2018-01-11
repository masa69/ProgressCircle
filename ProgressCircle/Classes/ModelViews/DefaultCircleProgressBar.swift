
import CircleProgressBar

class DefaultCircleProgressBar: CircleProgressBar {
    
    var duration: CGFloat = 0.0
    
    private var isRecording: Bool = false
    
    private var promise: Timer?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        /*
         // Progress Bar Customization
         @property (nonatomic) CGFloat progressBarWidth;
         @property (nonatomic) UIColor *progressBarProgressColor;
         @property (nonatomic) UIColor *progressBarTrackColor;
         @property (nonatomic) CGFloat startAngle;
         
         // Hint View Customization (inside progress bar)
         @property (nonatomic) BOOL hintHidden;
         @property (nonatomic) CGFloat hintViewSpacing;
         @property (nonatomic) UIColor *hintViewBackgroundColor;
         @property (nonatomic) UIFont *hintTextFont;
         @property (nonatomic) UIColor *hintTextColor;
         */
    }
    
    
    func start() {
        self.isRecording = true
        if self.promise == nil {
            // 一定時間毎に処理を行う
            self.promise = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.progress(_:)), userInfo: nil, repeats: true)
        }
    }
    
    
    func stop() {
        // 処理を止める
        self.promise?.invalidate()
        self.promise = nil
        self.isRecording = false
        self.resetProgress()
    }
    
    
    @objc private func progress(_ timer: Timer) {
        if self.isRecording {
            let progress: CGFloat = 0.01 / self.duration
            if self.progress < 1 {
//                print(self.progress)
                self.setProgress(self.progress + progress, animated: false)
            }
            return
        }
        self.resetProgress()
    }
    
    
    private func resetProgress() {
        self.setProgress(0, animated: false)
    }
    
}
