//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Vedant Patil on 08/02/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                
                //hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                    
                //headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                    
                //gallery
                Group{
                    headingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in picture")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                    
                //facts
                Group{
                    headingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InSetFactView(animal: animal)
                }
                .padding(.horizontal)
                    
                //description
                Group{
                    headingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .layoutPriority(2)
                }
                .padding(.horizontal)
                    
                //map
                Group{
                    headingView(headingImage: "map", headingText: "National Parks")
                    
                    InSetMapView()
                }
                .padding(.horizontal)
                    
                //link
                Group{
                    headingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            }//:VStack
            .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
        }//:ScrollView
    }
}

#Preview {
    do {
                let animals: [Animal] = try Bundle.main.decode("animals.json")
                return AnimalDetailView(animal: animals[0])
            } catch {
                // Handle error gracefully, such as displaying a placeholder view
                return Text("Error: \(error.localizedDescription)")
            }
}
