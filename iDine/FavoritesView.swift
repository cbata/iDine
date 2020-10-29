//
//  FavoritesView.swift
//  iDine
//
//  Created by Chris Bata on 10/22/20.
//

import SwiftUI

class NavigationFlag: ObservableObject {
}

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
//    @State var isShowingDetailView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites.items) { item in
                    FavoriteRow(item: item)
                }.onDelete(perform: deleteItems)
            }.navigationBarTitle("Favorites")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
