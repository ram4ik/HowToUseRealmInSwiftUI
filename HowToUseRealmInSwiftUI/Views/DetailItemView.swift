//
//  DetailItemView.swift
//  HowToUseRealmInSwiftUI
//
//  Created by Ramill Ibragimov on 02.03.2021.
//

import SwiftUI

struct DetailItemView: View {
    let item: Item
    
    @State private var name: String = ""
    @Environment(\.presentationMode) var presentation
    
    private var isFavorite: Binding<Bool> {
        Binding<Bool> {
            item.isFavorite
        } set: { value in
            item.update(isFavorite: value)
        }

    }
    
    var body: some View {
        VStack {
            Text("Edit item name")
            TextField("edit", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle(isOn: isFavorite) {
                Text("select as favorite")
            }
            
            Button {
                item.update(name: name)
                presentation.wrappedValue.dismiss()
            } label: {
                Text("Save")
            }
        }
        .padding()
        .onAppear() {
            name = item.name
        }
    }
}

struct DetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemView(item: Item())
    }
}
