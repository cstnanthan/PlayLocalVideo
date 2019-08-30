//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Nanthakumaran.
//  Copyright © 2019 Nanthakumaran. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
        
        Video(image: "videoScreenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
  
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playVideoButtonDidTouch(_ sender: AnyObject) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
        
    }
 }

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // Extensions must not contain stored properties
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 220
    }

    func numberOfSections(in tableView: UITableView) -> Int {
    return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
    let video = data[indexPath.row]

    cell.videoScreenshot.image = UIImage(named: video.image)
    cell.videoTitleLabel.text = video.title
    cell.videoSourceLabel.text = video.source

    return cell

    }
}

