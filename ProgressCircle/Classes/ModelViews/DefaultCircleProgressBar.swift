
import CircleProgressBar

class DefaultCircleProgressBar: CircleProgressBar {
    
    var duration: CGFloat = 0.0
    
    var didFinish: (() -> Void)?
    
    private var isValid: Bool = false
    
    private var isPause: Bool = false
    
    private var isFinish: Bool = false
    
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
        self.isValid = true
        self.isPause = false
        self.isFinish = false
        if self.promise == nil {
            // 一定時間毎に処理を行う
            self.promise = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.progress(_:)), userInfo: nil, repeats: true)
        }
    }
    
    
    func stop() {
        // 処理を止める
        self.promise?.invalidate()
        self.promise = nil
        self.isValid = false
        self.resetProgress()
    }
    
    
    func pause() {
        self.promise?.invalidate()
        self.promise = nil
        self.isPause = true
    }
    
    
    func resume() {
        self.promise?.invalidate()
        self.promise = nil
        self.start()
    }
    
    
    func update(progress: CGFloat, animated: Bool) {
        self.setProgress(progress, animated: animated)
    }
    
    
    private func resetProgress() {
        self.update(progress: 0, animated: false)
    }
    
    
    // MARK: - Timer
    
    @objc private func progress(_ sender: Timer) {
        if self.isPause {
            return
        }
        if self.isValid {
            let progress: CGFloat = 0.01 / self.duration
            if self.progress < 1 {
                self.update(progress: self.progress + progress, animated: false)
                return
            }
            if self.isFinish {
                return
            }
            self.didFinish?()
            self.isFinish = true
            return
        }
        self.resetProgress()
    }
    
}
