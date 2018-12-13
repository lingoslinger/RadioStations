//
//  RadioStationTableViewCell.swift
//  RadioStations
//
//  Created by Allan Evans on 11/17/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//

import UIKit
import ImageDownloader

class RadioStationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stationImageView: UIImageView!
    @IBOutlet weak var stationTitleLabel: UILabel!
    @IBOutlet weak var stationDescriptionLabel: UILabel!
    @IBOutlet weak var stationDJLabel: UILabel!
    var urlString:String?
    
    func setupRadioStationTableViewCellWithChannel(channel: Channel) {
        stationDescriptionLabel.text = channel.descriptionField ?? "No description available"
        stationTitleLabel.text = channel.title ?? "No title available"
        stationDJLabel.text = channel.dj ?? "No DJ Listed"
        self.stationImageView.image = UIImage.init(named: "placeholder.PNG")
        if let existingURLString = urlString {
            if let existingURL = URL(string: existingURLString) {
                ImageDownloadManager.shared.imageNotVisible(imageURL: existingURL)
            }
        }
        guard let urlString = channel.image, let url = URL(string: urlString) else {
            self.stationImageView.image = UIImage.init(named: "imageNotFound.png")
            return
        }
        self.urlString = urlString
        ImageDownloadManager.shared.downloadImage(imageURL: url) { (image, url, error) in
            DispatchQueue.main.async  {
                self.stationImageView.image = image
            }
        }
    }
}
