//
//  FavoriteDetail.swift
//  iDine
//
//  Created by Chris Bata on 10/24/20.
//

import SwiftUI

struct FavoriteDetail: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()

            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Button("Remove") {
            self.favorites.remove(item: self.item)
        }
)
    }
}

struct FavoriteDetail_Previews: PreviewProvider {
    static let order = Order()
    @State static var isShowing = false
    
    static var previews: some View {
        NavigationView {
            FavoriteDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}

