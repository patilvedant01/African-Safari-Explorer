//
//  InSetFactView.swift
//  Africa
//
//  Created by Vedant Patil on 08/02/24.
//

import SwiftUI

struct InSetFactView: View {
    // MARK:- properties
    let animal: Animal
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self){item in
                    Text(item)
                }
            }//:tabs
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148,idealHeight: 168,maxHeight: 180)
        }//:groupbox
    }
}

#Preview {
    do {
                let animals: [Animal] = try Bundle.main.decode("animals.json")
                return InSetFactView(animal: animals[0])
            } catch {
                // Handle error gracefully, such as displaying a placeholder view
                return Text("Error: \(error.localizedDescription)")
            }
}
