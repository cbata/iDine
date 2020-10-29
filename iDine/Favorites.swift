//
//  Favorites.swift
//  iDine
//
//  Created by Chris Bata on 10/22/20.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        guard !items.contains(item) else {
            return
        }
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
