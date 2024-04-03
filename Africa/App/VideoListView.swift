//
//  VideoListView.swift
//  Africa
//
//  Created by Vedant Patil on 22/01/24.
//

import SwiftUI

struct VideoListView: View {
    //MARK:- properties
    @State var videos : [Video]  = Bundle.main.decode("videos.json")
    
    //MARK:- view
    var body: some View {
        NavigationView{
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical,8)
                    }
                }//:loop
            }//:list
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{
                        videos.shuffle()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//:navigation
    }
}

#Preview {
    VideoListView()
}
