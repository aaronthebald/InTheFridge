//
//  AddItemSheet1.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 2/1/23.
//

import SwiftUI

struct AddItemSheet1: View {
    @EnvironmentObject var vm: ViewModel
    @State var textFieldText: String = ""
    @State var foodItemLocations: String = "Pantry"
    let Locations: [String] = ["Pantry", "Fridge", "Freezer"]
    @State var foodItemCount: Int = 0
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            List {
                TextField("Add Item here...", text: $textFieldText)
                
                Picker(selection: $foodItemLocations) {
                    ForEach(Locations, id: \.self) { location in
                        Text(location)
                            .tag(location)
                    }
                } label: {
                    Text("Location")
                }
                Picker(selection: $foodItemCount) {
                    ForEach(0..<100) { number in
                        Text("\(number)")
                    }
                } label: {
                    Text("Item count")
                }


            }
            Button("SAVE", action: saveItem)
        }
    }
    
    func saveItem() {
        vm.addFood(id: UUID().uuidString, location: foodItemLocations, name: textFieldText, inventory: foodItemCount, shopForMore: false, expirationDate: nil)
       // vm.updateLists()
        presentationMode.wrappedValue.dismiss()
    }
    
    struct AddItemSheet1_Previews: PreviewProvider {
        static var previews: some View {
            AddItemSheet1().environmentObject(ViewModel())
        }
    }
}
