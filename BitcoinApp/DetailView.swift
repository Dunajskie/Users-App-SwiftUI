//
//  DetailView.swift
//  BitcoinApp
//
//  Created by Michał Dunajski on 06/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreLocation
import MessageUI

struct DetailView: View {
    var details: Response
    var body: some View {
        ZStack{
            GeometryReader { proxy in
                MapView(coordinate: CLLocationCoordinate2D(latitude: Double(details.results[0].location.coordinates.latitude) ?? 0, longitude: Double(details.results[0].location.coordinates.longitude) ?? 0))
                    .frame(width: proxy.size.width, height: proxy.size.height/3, alignment: .top)
            }
            VStack{
                WebImage(url: URL(string: details.results[0].picture.large))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .padding()
                VStack(alignment: .leading){
                    HStack{
                        Text("Gender:")
                            .fontWeight(.semibold)
                        Text(details.results[0].gender)
                    }
                    .padding(.bottom)
                    HStack{
                        Text("Full name:")
                            .fontWeight(.semibold)
                        Text(details.results[0].name.title)
                        Text(details.results[0].name.first)
                        Text(details.results[0].name.last)
                    }
                    .padding(.bottom)
                    HStack{
                        Text("Email:")
                            .fontWeight(.semibold)
                        Text(details.results[0].email)
                    }
                }
                .padding()
                Button(action: {}) {
                            Text("Send mail")
                        }

                  
                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(details: Response(results: [PersonalData(gender: "Female", name: NameInfo(title: "Ms", first: "Anna", last: "Lewandowska"), picture: Picture(large: "https://randomuser.me/api/portraits/men/46.jpg"), location: Location(country: "USA", city: "LA", coordinates: Coordinate(latitude: "11", longitude: "11")), email: "edu@gmail.com")]))
    }
}


