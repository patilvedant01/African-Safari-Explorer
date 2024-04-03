//
//  VideoModel.swift
//  Africa
//
//  Created by Vedant Patil on 09/02/24.
//

import SwiftUI

struct Video: Codable,Identifiable{
    let id: String
    let name: String
    let headline: String 
    
    var thumbnail: String{
        "video-\(id)"
    }
}
