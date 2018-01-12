
import UIKit

class RecordViewController: UIViewController {
    
    @IBOutlet weak var homeButton: DefaultButton!
    @IBOutlet weak var thumbnailButton: DefaultButton!
    
    @IBOutlet weak var record1Button: TransparentButton!
    @IBOutlet weak var record1ProgressView: RecordCircleProgressBar!
    
    @IBOutlet weak var record2Button: TransparentButton!
    @IBOutlet weak var record2ProgressView: RecordGradientCircularProgress!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initProgress()
        self.initButton()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func initProgress() {
        record1Button.touchDown = {
            print("touchDown1")
        }
        record2Button.touchDown = {
            print("touchDown2")
        }
        record1Button.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(self.onPressingButton1(_:))))
        record2Button.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(self.onPressingButton2(_:))))
        
        record1ProgressView.didFinish = {
            print("finish 1")
        }
        record2ProgressView.didFinish = {
            print("finish 2")
        }
    }
    
    
    private func initButton() {
        homeButton.touchDown = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc: MainViewController = storyboard.instantiateInitialViewController() as! MainViewController
            self.present(vc, animated: false, completion: nil)
        }
        thumbnailButton.touchDown = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Thumbnail", bundle: nil)
            let vc: ThumbnailViewController = storyboard.instantiateInitialViewController() as! ThumbnailViewController
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    
    // MARK: - Gesture Recognizer
    
    @objc func onPressingButton1(_ sender: UIButton) {
        switch sender.state.rawValue {
        case 1:// start
            print("pressing start 1")
            record1ProgressView.start()
        case 2:// pressing
            break
        case 3:// end
            print("pressing end 1")
            record1ProgressView.stop()
        default:
            break
        }
    }
    
    
    @objc func onPressingButton2(_ sender: UIButton) {
        switch sender.state.rawValue {
        case 1:// start
            print("pressing start 2")
            record2ProgressView.start()
        case 2:// pressing
            break
        case 3:// end
            print("pressing end 2")
            record2ProgressView.stop()
        default:
            break
        }
    }
    
}
