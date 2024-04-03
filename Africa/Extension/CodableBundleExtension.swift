//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Vedant Patil on 05/02/24.
//

import SwiftUI

extension Bundle{
    func decode <T: Codable>(_ file: String) -> T {
        //.locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //.Create a property for the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        
        //.create a decoder
        let decoder = JSONDecoder()
        
        //.create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode data \(file) from bundle")
        }
        
        //.Return the ready to use data
        return loaded
        
    }
}

