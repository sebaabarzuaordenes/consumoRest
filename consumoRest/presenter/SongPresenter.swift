//
//  SongPresenter.swift
//  consumoRest
//
//  Created by Sebastian Abarzua on 9/12/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import Foundation


struct SongCellData {
    let name: String
    let artist: String
    let pic: String
    let previUrl: String
}

protocol SongView: NSObjectProtocol {
    func startLoad()
    func finishLoad()
    func setListSong(song: [SongCellData])
    func setNameSearsh()
}

class SongPresenter {
    
    private let searshService: SongSeervice
    
    weak private var songView : SongView?
    
    init(searshService:SongSeervice) {
        self.searshService = searshService
    }
    
    func attachView(view: SongView){
        songView = view
    }
    
    func detachView(){
        songView = nil
    }
    
    func getSong(){
        self.songView?.startLoad()
        searshService.callAPIGetsong(
            onSuccess: { (song) in
                self.songView?.finishLoad()
                if (song.count == 0){
                    self.songView
                } else {
                    let mappedSong = song.map {_ in
                        return SongCellData(name: "\(neme)", artist: "\(artis)", pic: "\(pic)", previUrl: "\(previUrl)")
                    }
                    self.songView?.setListSong(song: mappedSong)
                }
            },
            onFailure: { (errorMessage) in
                self.songView?.finishLoad()
            }
        )
    }
    
}
