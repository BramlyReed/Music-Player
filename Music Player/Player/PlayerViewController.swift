import Foundation
import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
  var position = 0
  var songsData: [Song]?
  private var holderView = UIView()
  var player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configure()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    player?.stop()
  }
  
  func configure() {
    let song = songsData?[position]
    let urlString = Bundle.main.path(forResource: song?.trackName, ofType: "mp3")
    do {
      try AVAudioSession.sharedInstance().setMode(.default)
      try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
      guard let urlString = urlString else {
        return
      }
      player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
      player?.play()
    }
    catch {
      print("error occurred")
    }
  }
}
