//
//  SearshService.swift
//  consumoRest
//
//  Created by Sebastian Abarzua on 9/12/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import Foundation

class SongSeervice {
    public func callAPIGetsong(onSuccess successCallback: ((_ people: [SongModel]) -> Void)?,
                                 onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        APICall.instance.callAPIGetSong(
            onSuccess: { (song) in
                successCallback?(song)
        },
            onFailure: { (errorMessage) in
                failureCallback?(errorMessage)
        }
        )
    }
}
