import Foundation
import UIKit

class PlayerViewController: UIViewController {
  var position = 0
  var songsData = [Song]()
  private var holderView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  func configure() {
    
  }
}
