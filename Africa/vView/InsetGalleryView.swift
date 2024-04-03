//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Vedant Patil on 08/02/24.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: properties
    let animal : Animal
    
    //MARK: view
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center,spacing: 15){
                ForEach(animal.gallery,id: \.self){
                    item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//:loop
            }//:hstack
        }//:scroll view
    }
}

#Preview {
    do {
                let animals: [Animal] = try Bundle.main.decode("animals.json")
                return InsetGalleryView(animal: animals[0])
            } catch {
                // Handle error gracefully, such as displaying a placeholder view
                return Text("Error: \(error.localizedDescription)")
            }
}
