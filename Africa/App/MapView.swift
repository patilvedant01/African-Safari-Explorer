//
//  MapView.swift
//  Africa
//
//  Created by Vedant Patil on 22/01/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK:- properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437799)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK:- view
    var body: some View {
        //basic map
        //Map(coordinateRegion: $region)
        
        //advanced map
        Map(coordinateRegion: $region,annotationItems: locations,annotationContent: {
            item in
            //(A) pin style (always static)
            //MapPin(coordinate: item.location,tint: .accentColor)
            
            //(B) marker(always static)
//            MapMarker(coordinate: item.location,tint: .accentColor)
            
            //(C) custom basic annotation
//            MapAnnotation(coordinate: item.location, content: {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32,height: 32,alignment: .center)
//            })//:annotation
            
            //(D) custom advanced annotatio
            MapAnnotation(coordinate: item.location, content: {
                MapAnnotationView(location: item)
            })//:mapAnnotation
        })//:map
        .overlay(
            HStack {
                
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48,height: 48,alignment: .center)
                
                VStack(alignment: .leading,spacing: 3){
                    
                    HStack{
                        Text("Latitude:-")
                            .foregroundColor(.accentColor)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.footnote)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude:-")
                            .foregroundColor(.accentColor)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.footnote)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                    }
                }
            }//:hstack
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(
                    Color.black
                        .opacity(0.6)
                        .cornerRadius(8)
                )
                .padding()
            ,alignment: .top
                
        )
    }
}

#Preview {
    MapView()
}
