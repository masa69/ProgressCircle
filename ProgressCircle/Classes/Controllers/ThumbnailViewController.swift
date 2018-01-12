
import UIKit

class ThumbnailViewController: UIViewController {
    
    @IBOutlet weak var homeButton: DefaultButton!
    @IBOutlet weak var recordButton: DefaultButton!
    
    @IBOutlet weak var thumbnail1View: ThumbnailView!
    @IBOutlet weak var thumbnail1ProgressView: ThumbnailCircleProgressBar!
    
    @IBOutlet weak var thumbnail2View: ThumbnailView!
    @IBOutlet weak var thumbnail2ProgressView: ThumbnailGradientCircularProgress!
    
    
    var isValidQueue: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initProgress()
        self.initButton()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.isValidQueue = false
    }
    
    
    private func initProgress() {
        
        thumbnail1ProgressView.didFinish = {
            print("finish 1")
        }
        thumbnail2ProgressView.didFinish = {
            print("finish 2")
        }
        
        self.isValidQueue = true
        self.start1()
        self.start2()
    }
    
    
    private func initButton() {
        homeButton.touchDown = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: MainViewController = storyboard.instantiateInitialViewController() as! MainViewController
            self.present(vc, animated: false, completion: nil)
        }
        recordButton.touchDown = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Record", bundle: nil)
            let vc: RecordViewController = storyboard.instantiateInitialViewController() as! RecordViewController
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    
    private func start1() {
        let duration: CGFloat = thumbnail1View.currentViewDuration
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(duration)
        
        thumbnail1ProgressView.stop()
        thumbnail1ProgressView.start(duration: duration)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            if self.isValidQueue {
                self.thumbnail1View.nextView()
                self.start1()
            }
        }
    }
    
    
    private func start2() {
        let duration: CGFloat = thumbnail2View.currentViewDuration
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(duration)
        
        thumbnail2ProgressView.stop()
        thumbnail2ProgressView.start(duration: duration)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            if self.isValidQueue {
                self.thumbnail2View.nextView()
                self.start2()
            }
        }
    }
    
}
