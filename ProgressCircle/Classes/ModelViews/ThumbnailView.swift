
import UIKit

class ThumbnailView: UIView {
    
    private var firstView: UIView?
    private var secondView: UIView?
    private var thirdView: UIView?
    
    private var currentIndex: Int = 0 {
        didSet {
            self.update()
        }
    }
    
    private var views: [(view: UIView, duration: CGFloat)] = []
    
    var currentViewDuration: CGFloat {
        get {
            return self.views[self.currentIndex].duration
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let frame: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        firstView = UIView(frame: frame)
        secondView = UIView(frame: frame)
        thirdView = UIView(frame: frame)
        if let f: UIView = firstView, let s: UIView = secondView, let t: UIView = thirdView {
            f.backgroundColor = UIColor.red
            s.backgroundColor = UIColor.blue
            t.backgroundColor = UIColor.green
            self.views.append((view: f, duration: 2.0))
            self.views.append((view: s, duration: 3.0))
            self.views.append((view: t, duration: 4.0))
            self.addSubview(f)
            self.addSubview(s)
            self.addSubview(t)
            self.update()
        }
    }
    
    
    func nextView() {
        self.currentIndex = (self.currentIndex + 1 > 2) ? 0 : self.currentIndex + 1
    }
    
    
    func prevView() {
        self.currentIndex = (self.currentIndex - 1 < 0) ? 2 : self.currentIndex - 1
    }
    
    
    private func update() {
        for (i, list) in self.views.enumerated() {
            list.view.alpha = (i == self.currentIndex) ? 1 : 0
        }
    }
    
}
