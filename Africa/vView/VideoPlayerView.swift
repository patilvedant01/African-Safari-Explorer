//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Vedant Patil on 09/02/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK:- properties
    var videoSelected: String
    var videoTitle: String
    
    //MARK:-view
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")){
                
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.vertical,6)
                    .padding(.horizontal,8)
                ,alignment: .topLeading
            )
        }//:VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle,displayMode: .inline)
    }
}

#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
