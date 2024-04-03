//
//  ContentView.swift
//  Africa
//
//  Created by Vedant Patil on 22/01/24.
//

import SwiftUI

struct ContentView: View {
    //MARK:- properties
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive : Bool = false
    
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()),count: 2)
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count%3 + 1)
        gridColumn = gridLayout.count
        print("\(gridColumn)")
        
        switch gridColumn {
            case 1 :
                toolBarIcon = "rectangle.grid.1x2"
            case 2 :
                toolBarIcon = "square.grid.2x2"
            case 3 :
                toolBarIcon = "rectangle.grid.3x2"
            default:
                toolBarIcon = "rectangle.grid.1x2"
        }
    }
    //MARK:- view
    var body: some View {
        NavigationView{
            
            Group{
                if !isGridViewActive{   
                    List(){
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom:0, trailing: 0))
                        
                        AnimalListItemView()
                   }}//:list
                else{
                    ScrollView(.vertical,showsIndicators: true) {
                        
                        LazyVGrid(columns: gridLayout,alignment: .center,spacing: 10) {
                            
                            ForEach(animals) { animal in
                                
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//:navigation
                                
                            }//:loop
                            
                        }//:lazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    }//:scrollViewGrid
                }
                
            }//: group
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        //list
                        Button(action: {
                            print("List view is activated.")
                            isGridViewActive=false
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //grid
                        Button(action: {
                            print("Grid view is activated.")
                            isGridViewActive = true
                            gridSwitch()
                        }){
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }//:navigation view
    }
}

#Preview {
    ContentView()
}
