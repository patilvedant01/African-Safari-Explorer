//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Vedant Patil on 09/02/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: properties
    let animal : Animal
    
    //MARK: view
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                        Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name,destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }//:Hstack
        }//box
    }
}

#Preview {
    do {
                let animals: [Animal] = try Bundle.main.decode("animals.json")
                return ExternalWebLinkView(animal: animals[0])
            } catch {
                // Handle error gracefully, such as displaying a placeholder view
                return Text("Error: \(error.localizedDescription)")
            }
}
