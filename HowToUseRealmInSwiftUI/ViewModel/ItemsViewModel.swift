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
    
    @Published var items = List<Item>()
    @Published var selectedGroup: Group? = nil
    
    var token: NotificationToken? = nil
    
    var realm: Realm?
    
    init() {
        let realm = try? Realm()
        self.realm = realm
        
        if let group = realm?.objects(Group.self).first {
            self.selectedGroup = group
            self.items = group.items
        } else {
            try? realm?.write({
                let group = Group()
                realm?.add(group)
                
                group.items.append(Item())
                group.items.append(Item())
                group.items.append(Item())
            })
        }
        
//        token = selectedGroup?.observe({ [unowned self] (changes) in
//            switch changes {
//            case .error(_): break
//            case .change(_, _): self.objectWillChange.send()
//            case .deleted: self.selectedGroup = nil
//            }
//        })
        
        token = selectedGroup?.items.observe({ (changes) in
            switch changes {
            case .error(_): break
            case .initial(_): break
            case .update(_, deletions: _, insertions: _, modifications: _):
                self.objectWillChange.send()
            }
        })
    }
    
    func addNewItem() {
        if let realm = selectedGroup?.realm {
            try? realm.write {
                selectedGroup?.items.append(Item())
            }
        }
    }
    
    func delete(at indexSet: IndexSet) {
        if let index = indexSet.first, let realm = items[index].realm {
            try? realm.write {
                realm.delete(items[index])
            }   
        }
    }
}
