import UIKit
import AVFoundation
import SnapKit

class StartScreenVC: UIViewController {
  
  private var songsTable: UITableView = {
    let table = UITableView()
    table.register(MusicCell.self, forCellReuseIdentifier: MusicCell.identifier)
    table.rowHeight = 100
    table.isUserInteractionEnabled = true
    return table
  }()
  private var songsData = [Song]()
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    songsTable.delegate = self
    songsTable.dataSource = self
    view.backgroundColor = UIColor.red
    setUI()
  }
  
  private func setUI() {
    addTableView()
  }
}

extension StartScreenVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.identifier, for: indexPath)
    cell.textLabel?.text = "FAFASFSAF"
    cell.imageView?.image = UIImage(named: "maralin.png")
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //present player with music
    let position = indexPath.item
    let vc = PlayerViewController()
    vc.songsData = [
      Song(name: "song1", albumName: "so1", artistName: "ЕгорКрид", imageName: "", trackName: "song1"),
      Song(name: "song2", albumName: "so2", artistName: "ЕгорКрид", imageName: "", trackName: "song2"),
      Song(name: "song3", albumName: "so3", artistName: "ЕгорКрид", imageName: "", trackName: "song3")
    ]
    vc.position = position
    navigationController?.present(vc, animated: true)
  }
  
  private func addTableView() {
    view.addSubview(songsTable)
    songsTable.backgroundColor = .yellow
    songsTable.snp.makeConstraints { make in
      make.left.top.right.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
}
