//
//  ItemsListView.swift
//  HowToUseRealmInSwiftUI
//
//  Created by Ramill Ibragimov on 02.03.2021.
//

import SwiftUI
import RealmSwift

struct ItemsListView: View {
    @StateObject var itemViewModel = ItemsViewModel()
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(itemViewModel.items.freeze()) { item in
                    NavigationLink(destination: DetailItemView(item: itemViewModel.realm!.resolve(ThreadSafeReference(to: item))!
                    )) {
                        HStack {
                            Text(item.name)
                            if item.isFavorite {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                }
                .onDelete { (indexSet) in
                    itemViewModel.delete(at: indexSet)
                }
            }
            .navigationTitle("Items")
            .navigationBarItems(trailing: Button(action: {
                itemViewModel.addNewItem()
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView()
    }
}
