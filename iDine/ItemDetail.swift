//
//  ItemDetail.swift
//  iDine
//
//  Created by Chris Bata on 10/9/20.
//

import SwiftUI

struct ItemDetail: View {
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
            Button("Order This") {
                self.order.add(item: self.item)
            }
            .padding()
            .font(.headline)
            .background(Color.white)
            .foregroundColor(.blue)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1)
            )

            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Button("Favorite") {
            self.favorites.add(item: self.item)
            print("self.favorites: \(self.favorites.items)")
            }
        .disabled(self.favorites.items.contains(item))
        )
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
