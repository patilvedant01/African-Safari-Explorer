//
//  VideoListItemView.swift
//  Africa
//
//  Created by Vedant Patil on 09/02/24.
//

import SwiftUI

struct VideoListItemView: View {
    let video : Video
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(8)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//:ZStack
            
            VStack(alignment: .leading,spacing: 10){
                Text(video.name)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Text(video.headline)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .font(.footnote)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            }
        }//:HStack
    }
}

#Preview {
    do {
                let videos: [Video] = try Bundle.main.decode("videos.json")
        return VideoListItemView(video: videos[0])
            } catch {
                // Handle error gracefully, such as displaying a placeholder view
                return Text("Error: \(error.localizedDescription)")
            }
}
