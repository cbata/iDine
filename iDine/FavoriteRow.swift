//
//  FavoriteRow.swift
//  iDine
//
//  Created by Chris Bata on 10/24/20.
//

import SwiftUI


struct FavoriteRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item: MenuItem
    @EnvironmentObject var favorites: Favorites
    @State var isShowingDetailView = false

    var body: some View {
        
        NavigationLink(destination: FavoriteDetail(item: item), isActive: $isShowingDetailView) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        
                }
            }
        }
    }
}

struct FavoriteRow_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRow(item: MenuItem.example)
    }
}
