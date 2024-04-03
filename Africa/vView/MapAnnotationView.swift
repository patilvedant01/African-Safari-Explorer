//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Vedant Patil on 11/02/24.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK:-properties
    let location: NationalParkLocation
    @State private var Animation : Double = 0.0
    
    //MARK:-view
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(.accentColor)
                .frame(width: 54,height: 54,alignment: .center)
            
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52,alignment: .center)
                .scaleEffect(1 + CGFloat(Animation))
                .opacity(1-Animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48,alignment: .center)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }//:ZStack
        .onAppear{
            withAnimation(SwiftUI.Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
                Animation = 1
            }
        }
    }
}

#Preview {
    do {
                let locations: [NationalParkLocation] = try Bundle.main.decode("locations.json")
                return MapAnnotationView(location: locations[0])
            } catch {
                // Handle error gracefully, such as displaying a placeholder view
                return Text("Error: \(error.localizedDescription)")
            }
}
