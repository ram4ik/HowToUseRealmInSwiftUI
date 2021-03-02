//
//  ItemsListView.swift
//  HowToUseRealmInSwiftUI
//
//  Created by Ramill Ibragimov on 02.03.2021.
//

import SwiftUI

struct ItemsListView: View {
    @StateObject var itemViewModel = ItemsViewModel()
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(itemViewModel.items) { item in
                    Text(item.name)
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
