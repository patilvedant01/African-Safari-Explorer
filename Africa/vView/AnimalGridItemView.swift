//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Vedant Patil on 11/02/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK:- properties
    let animal: Animal
    
    //MARK:-view
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    do {
                let animals: [Animal] = try Bundle.main.decode("animals.json")
                return AnimalGridItemView(animal: animals[0])
            } catch {
                // Handle error gracefully, such as displaying a placeholder view
                return Text("Error: \(error.localizedDescription)")
            }
}
