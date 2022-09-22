//
//  ContentView.swift
//  Movie App
//
//  Created by Abdallah Alshemeri on 22/09/2022.
//

import SwiftUI

struct Actors: Identifiable {
    let id = UUID()
    let image : String
    let name: String
}

struct MoviesInfo: Identifiable {
    let id = UUID()
    
    var titl: String
    var image: String
    var cast : [Actors]
}

struct ContentView: View {
    let Movies = [
        MoviesInfo(titl: "The Lord of The Rings", image: "lotr", cast: [
        
            Actors(image: "elijah", name: "Elijah Wood"),
            Actors(image: "ian", name: "Ian McKellen"),
            Actors(image: "cate", name: "Cate Blanchett"),
            Actors(image: "bloom", name: "Orlando Bloom"),
            Actors(image: "bean", name: "Sean Bean")
        
        ]),
        MoviesInfo(titl: "The Prestige", image: "thepre", cast: [
                    
                    Actors(image: "bale", name: "Christian Bale"),
                    Actors(image: "hugh", name: "Hugh Jackman"),
                    Actors(image: "caine", name: "Michael Caine"),
                    Actors(image: "johan", name: "Scarlett Johansson"),
                    Actors(image: "hall", name: "Rebecca Hall")
                
        ]),
        
        
        MoviesInfo(titl: "Bullet Train", image: "bullet", cast: [
                    
                    Actors(image: "pitt", name: "Brad Pitt"),
                    Actors(image: "sandra", name: "Sandra Bullock"),
                    Actors(image: "bunny", name: "Bad Bunny"),
                    Actors(image: "king", name: "Joey King"),
                    Actors(image: "aaron", name: "Aaron Taylor-Johnson")
                
        ])
        
        
        
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(Movies) { movie in
                    NavigationLink(destination: Moviecast(Movies: movie)) {
                        MovieView(Movies: movie)
                    }
                }
            }
            .navigationTitle("Movies List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieView: View {
    let Movies: MoviesInfo
    var body: some View {
        HStack{
            Image(Movies.image)
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            Text(Movies.titl)
                .font(.title)
        }
    }
}

struct Moviecast: View {
    let Movies: MoviesInfo
    var body: some View {
        ZStack{
            Image(Movies.image)
                .resizable()
                .scaledToFill()
                .blur(radius: 10)
                .ignoresSafeArea()
            VStack{
                Image(Movies.image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                Text(Movies.titl)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .padding()
                ScrollView (.horizontal) {
                    HStack{
                        ForEach(Movies.cast) {
                            Actor in
                            VStack{
                                Text(Actor.name)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                                Image(Actor.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 155)
                            }
                        }
                    }
                }
                
            }
        }
    }
}
