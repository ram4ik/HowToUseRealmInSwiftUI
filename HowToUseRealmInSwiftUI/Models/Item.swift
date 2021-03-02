//
//  Item.swift
//  HowToUseRealmInSwiftUI
//
//  Created by Ramill Ibragimov on 02.03.2021.
//

import Foundation
import RealmSwift

final class Item: Object, ObjectKeyIdentifiable {
    // Identifiable, ObservableObject
    
    @objc dynamic var _id = ObjectId.generate()
    
    @objc dynamic var name: String = Item.randomName()
    
    @objc dynamic var isFavorite: Bool = false
    
    // backlink to group
    var group = LinkingObjects(fromType: Group.self, property: "items")
    
    override class func primaryKey() -> String? {
        "_id"
    }
    
    static func randomName() -> String {
        let randomNames = ["floor", "monitor", "hair tie", "puddle", "hair brush", "bread", "cinder block", "glass", "ring", "twister", "coaster", "fridge", "toe ring", "bracelet", "cabinet", "nail file", "plate", "lace", "cork", "mouse pad"]
        
        return randomNames.randomElement() ?? "new item"
    }
}
