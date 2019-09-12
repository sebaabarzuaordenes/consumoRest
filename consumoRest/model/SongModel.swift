//
//  SongModel.swift
//  consumoRest
//
//  Created by Sebastian Abarzua on 9/12/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import Foundation

class SongModel {
    var songName: String?
    var songArtisName: String?
    var songArtwork: String?
    var songPlay: String?
    
    func loadFromDictionary(_ dict: [String: AnyObject]) {
        if let data = dict["trackName"] as? String{
            self.songName = data
        }
        if let data = dict["artistName"] as? String{
            self.songArtisName = data
        }
        if let data = dict["artworkUrl100"] as? String{
            self.songArtwork = data
        }
        if let data = dict["previewUrl"] as? String{
            self.songPlay = data
        }
    }
    
    class func build(_ dict: [String: AnyObject]) -> SongModel {
        
        let contract = SongModel()
        contract.loadFromDictionary(dict)
        return contract
        
    }
}
