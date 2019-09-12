//
//  ViewController.swift
//  consumoRest
//
//  Created by Sebastian Abarzua on 9/12/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    <#code#>
}


class SongViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension SongViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongTableViewCell
        let SongViewData = SongToDisplay[indexPath.row]
        cell.labelTitle?.text = songViewData.name
        cell.labelSubtitle?.text = songViewData.artis
        return cell
    }
}

extension SongViewController: SongView{
    
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setListSong(song: [SongViewData]) {
        songToDisplay = song
        tableView?.isHidden = false
        tableView?.reloadData()
    }
    
    func setEmptyPeople() {
        tableView?.isHidden = true
    }
}
