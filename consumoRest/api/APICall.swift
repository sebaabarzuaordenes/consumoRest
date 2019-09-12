//
//  APICall.swift
//  consumoRest
//
//  Created by Sebastian Abarzua on 9/12/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let API_BASE_URL = "https://itunes.apple.com/search?term="
let API_LATE_URL = "&mediaType=music&limit=20"

class APICall {
    
    static let instance = APICall()
    
    enum RequestMethod {
        case get
    }
    
    var nameSearsh = ""
    
    func callAPIGetSong(onSuccess successCallback: ((_ people: [SongModel]) -> Void)?,
                          onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let url = API_BASE_URL + nameSearsh + API_LATE_URL
        
        self.createRequest(
            url, method: .get, headers: nil, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                
                if let responseDict = responseObject["data"].arrayObject {
                    let songResult = responseDict as! [[String:AnyObject]]
                    
                    var data = [SongModel]()
                    for item in songResult {
                        let single = SongModel.build(item)
                        data.append(single)
                    }
                    
                    successCallback?(data)
                } else {
                    failureCallback?("An error has occured.")
                }
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
        }
        )
    }
    
    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: AnyObject?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
        ) {
        
        Alamofire.request(url, method: method).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    callback(error.localizedDescription)
                }
            }
        }
    }
}
