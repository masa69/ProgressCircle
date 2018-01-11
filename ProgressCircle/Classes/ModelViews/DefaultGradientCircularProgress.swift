
import GradientCircularProgress

class DefaultGradientCircularProgress: UIView {
    
    var duration: CGFloat = 0.0
    
    private var isRecording: Bool = false
    
    private var promise: Timer?
    
    private var progress: CGFloat = 0.0 {
        didSet {
            self.gradientCircularProgress.updateRatio(self.progress)
        }
    }
    
    private let gradientCircularProgress: GradientCircularProgress = GradientCircularProgress()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    
    func initView(style: StyleProperty, display: Bool) {
        let frame: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        if let v: UIView = gradientCircularProgress.showAtRatio(frame: frame, display: display, style: style) {
            self.addSubview(v)
            self.resetProgress()
        }
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
                self.progress = self.progress + progress
            }
            return
        }
        self.resetProgress()
    }
    
    
    private func resetProgress() {
        self.progress = 0
    }
    
}
