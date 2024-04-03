//
//  headingView.swift
//  Africa
//
//  Created by Vedant Patil on 08/02/24.
//

import SwiftUI

struct headingView: View {
    //MARK: properties
    let headingImage: String
    let headingText: String
    
    //MARK: view
    var body: some View {
        
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    headingView(headingImage: "photo.on.rectangle.angled",headingText:"Wilderness in Pictures")
}
