//
//  Group.swift
//  HowToUseRealmInSwiftUI
//
//  Created by Ramill Ibragimov on 02.03.2021.
//

import Foundation
import RealmSwift

final class Group: Object, ObjectKeyIdentifiable {
    
    @objc dynamic var _id = ObjectId.generate()
    
    @objc dynamic var name: String = "new"
     
    override class func primaryKey() -> String? {
        "_id"
    }
    
    var items = RealmSwift.List<Item>() 
    
}
