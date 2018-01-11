
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var recordButton: DefaultButton!
    @IBOutlet weak var thumbnailButton: DefaultButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initButton()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func initButton() {
        recordButton.touchDown = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Record", bundle: nil)
            let vc: RecordViewController = storyboard.instantiateInitialViewController() as! RecordViewController
            self.present(vc, animated: false, completion: nil)
        }
        thumbnailButton.touchDown = {
            let storyboard: UIStoryboard = UIStoryboard(name: "Thumbnail", bundle: nil)
            let vc: ThumbnailViewController = storyboard.instantiateInitialViewController() as! ThumbnailViewController
            self.present(vc, animated: false, completion: nil)
        }
    }
    
}
