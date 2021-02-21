//
//  ContentView.swift
//  H4X0R News
//
//  Created by Андрий Пристайко on 08.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
                
            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear(perform: {
            self.networkManager.fetchDara()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hey"),
//    Post(id: "3", title: "Bonjur")
//]
