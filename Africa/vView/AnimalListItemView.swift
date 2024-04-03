//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Vedant Patil on 07/02/24.
//

import SwiftUI

struct AnimalListItemView: View {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    var body: some View {
        
        ForEach(animals) { animal in
            NavigationLink(destination: AnimalDetailView(animal: animal)){
                HStack(alignment: .center,spacing: 16){
                    Image(animal.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90,height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading,spacing: 8){
                        Text(animal.name)
                            .foregroundColor(.accentColor)
                            .fontWeight(.heavy)
                            .font(.title2)
                        
                        Text(animal.headline)
                            .font(.footnote)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .padding(.trailing, 8)
                    }//: VStack
                }//:HStack

            }
        }
        
            }
}

#Preview {
    AnimalListItemView()
}
