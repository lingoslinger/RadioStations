//
//  RadioStationDetailViewController.swift
//  RadioStations
//
//  Created by Allan Evans on 11/17/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//

import UIKit
import ImageDownloader

class RadioStationDetailViewController: UIViewController {
    
    @IBOutlet weak var stationDetailLargeImageView: UIImageView!
    @IBOutlet weak var stationDetailTitleLabel: UILabel!
    @IBOutlet weak var stationDetailDJLabel: UILabel!
    @IBOutlet weak var stationDetailDJEmailLabel: UILabel!
    @IBOutlet weak var stationDetailListenerCountLabel: UILabel!
    @IBOutlet weak var stationDetailGenreLabel: UILabel!
    
    var detailChannel: Channel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationDetailTitleLabel.text = detailChannel.title
        stationDetailDJLabel.text = detailChannel.dj
        stationDetailDJEmailLabel.text = detailChannel.djmail
        stationDetailListenerCountLabel.text = "Listeners: \(detailChannel.listeners ?? "Listener Count Unavailable")"
        stationDetailGenreLabel.text = detailChannel.genre
        stationDetailLargeImageView.image = UIImage.init(named: "placeholder.PNG")
        guard let urlString = detailChannel.largeimage, let url = URL(string: urlString) else {
            stationDetailLargeImageView.image = UIImage.init(named: "imageNotFound.png")
            return
        }
        ImageDownloadManager.shared.downloadImage(imageURL: url) { (image, url, error) in
            DispatchQueue.main.async  {
                self.stationDetailLargeImageView.image = image
            }
        }
    }
}
