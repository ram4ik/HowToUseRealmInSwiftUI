//
//  ItemsViewModel.swift
//  HowToUseRealmInSwiftUI
//
//  Created by Ramill Ibragimov on 02.03.2021.
//

import Foundation
import RealmSwift
import Combine

class ItemsViewModel: ObservableObject {
    
    @Published var items = [Item]()
    @Published var selectedGroup: Group? = nil
    
    init() {
        let realm = try? Realm()
        
        if let group = realm?.objects(Group.self).first {
            self.selectedGroup = group
            let items: List<Item> = group.items
            self.items = Array(items)
        } else {
            try? realm?.write({
                let group = Group()
                realm?.add(group)
                
                group.items.append(Item())
                group.items.append(Item())
                group.items.append(Item())
            })
        }
    }
}
