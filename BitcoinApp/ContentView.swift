//
//  ContentView.swift
//  BitcoinApp
//
//  Created by Michał Dunajski on 02/09/2021.
//

import SwiftUI
import CoreLocation


struct ContentView: View {
    @State var usersResponse: [Response] = [Response]()
    var body: some View {
        NavigationView {
            List(usersResponse){ response in
                NavigationLink(
                    destination: DetailView(details: response),
                    label: {
                        PersonListView(personInfo: response)
                    })
            }
            .navigationTitle("Users")
            .navigationBarItems(trailing:
                            Button(action: {
                                makeList()
                                
                            }) {
                                Text("Add")
                            }
                        )
        }
        .onAppear{
            makeList()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView {
    func getData() {
        let url = "https://randomuser.me/api/"
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print("fail")
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Response.self, from: data)
                    self.usersResponse.append(result)
                    print(result)
                } catch {
                    print("failed to covert")
                }
            }
        })
        task.resume()
    }
    
    func makeList() {
        for _ in 0...4 {
            getData()
        }
    }
}
