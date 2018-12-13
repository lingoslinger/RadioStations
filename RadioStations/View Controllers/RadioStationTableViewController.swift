//
//  ViewController.swift
//  RadioStations
//
//  Created by Allan Evans on 11/17/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//

import UIKit

class RadioStationTableViewController: UITableViewController, UISearchBarDelegate {
    let tableSections = 1
    let stationCellHeight: CGFloat = 90.0
    
    var radioStationList: RadioStationList?
    var channelArray = [Channel]()
    
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromWebService()
    }
    
    // MARK: - UITableViewDataSource and UITableViewDelegate methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return stationCellHeight;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RadioStationTableViewCell") as! RadioStationTableViewCell
        cell.setupRadioStationTableViewCellWithChannel(channel: channelArray[indexPath.row])
        return cell
    }
    
    // MARK: - UISearchBar delegate methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.count) == 0 {
            channelArray = self.radioStationList?.channels ?? [Channel]()
        } else {
            channelArray = self.radioStationList?.channelsFilteredByDJ(searchText: searchText) ?? [Channel]()
        }
        tableView.reloadData()
    }
    
    // MARK: - navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "RadioStationDetailViewController") {
            guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
            let detailViewController = segue.destination as! RadioStationDetailViewController
            detailViewController.detailChannel = channelArray[indexPath.row]
        }
    }
    
    // MARK: - private methods
    private func loadDataFromWebService() {
        let radioStationURLSession = RadioStationURLSession()
        let completionHander : SessionCompletionHandler = {(data : Data?, response : URLResponse?, error : Error?) -> Void in
            if (error == nil) {
                guard let jsonData = data else {
                    DispatchQueue.main.async(execute: {
                        self.showErrorDialogWithMessage(message: error?.localizedDescription ?? "No valid JSON data found")
                    })
                    return
                }
                self.radioStationList = jsonData.decodeRadioStationData()
                self.channelArray = self.radioStationList?.channels ?? [Channel]()
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            } else {
                DispatchQueue.main.async(execute: {
                    self.showErrorDialogWithMessage(message: error?.localizedDescription ?? "Unknown network error")
                })
            }
        }
        radioStationURLSession.sendRequest(completionHander)
    }
}
