//
//  AddItemSheet1.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 2/1/23.
//

import SwiftUI

struct AddItemSheet1: View {
    let Locations: [String] = ["Pantry", "Fridge", "Freezer"]
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: ViewModel
    
    // New food variables
    @State var textFieldText: String = ""
    @State var foodItemLocations: String = "Pantry"
    @State var foodItemCount: Int = 0
    
    // logic to add/alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    @State var addToShoppingList: Bool = false
    
    
    
    
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
               Toggle("Save to shopping list", isOn: $addToShoppingList)


            }
           .frame(height: 220)
            Button("SAVE", action: saveItem)
            Spacer()

        }
        .background(.thinMaterial)
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    
    // FUNCTIONS
    
    
    func saveItem() {
        if nameIsAppropiate() {
            if itemIsValid() {
                if addToShoppingList && foodItemCount == 0 {
                    vm.addFood(id: UUID().uuidString, location: "", name: textFieldText, inventory: foodItemCount, shopForMore: true, expirationDate: nil)
                } else if addToShoppingList && foodItemCount > 1 {
                    vm.addFood(id: UUID().uuidString, location: foodItemLocations, name: textFieldText, inventory: foodItemCount, shopForMore: true, expirationDate: nil)
                } else {
                    vm.addFood(id: UUID().uuidString, location: foodItemLocations, name: textFieldText, inventory: foodItemCount, shopForMore: false, expirationDate: nil)
                }
                presentationMode.wrappedValue.dismiss()
            }
            
        }
    }
    
    func nameIsAppropiate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "The name of your food item must be 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func itemIsValid() -> Bool {
        if foodItemCount < 1 && !addToShoppingList {
            alertTitle = "Please toggle \"Save to shopping list\" or adjust Item count to at least 1"
            showAlert.toggle()
            return false
        } else {return true}
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    
    
    
    // Preview
    struct AddItemSheet1_Previews: PreviewProvider {
        static var previews: some View {
            AddItemSheet1().environmentObject(ViewModel())
        }
    }
}
