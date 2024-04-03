//
//  CoverImageView.swift
//  Africa
//
//  Created by Vedant Patil on 27/01/24.
//

import SwiftUI

struct CoverImageView: View {
    //properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //view
    var body: some View {
        TabView{
            ForEach(coverImages){item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
