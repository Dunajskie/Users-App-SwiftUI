//
//  PopulationListView.swift
//  BitcoinApp
//
//  Created by Michał Dunajski on 02/09/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PersonListView: View {
    var personInfo: Response?
    var body: some View {
        HStack {
            WebImage(url: URL(string: personInfo?.results[0].picture.large ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .clipShape(Circle())
                            .shadow(radius: 5)
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                .padding(.trailing)
                
            VStack(alignment: .leading, spacing: 3) {
                Text((personInfo?.results[0].name.first ?? "")  + " " + (personInfo?.results[0].name.last ?? ""))
                    .fontWeight(.semibold)
                Text(personInfo?.results[0].location.country ?? "")
                    .font(.subheadline)
            }
            
            
        }
    }
}

struct PopulationListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}
