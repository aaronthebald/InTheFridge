//
//  ViewModel.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/29/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var foodList: [FoodModel] = []
    @Published var freezerList: [FoodModel] = []
    @Published var pantryList: [FoodModel] = []
    @Published var fridgeList: [FoodModel] = []
    @Published var shoppingList: [FoodModel] = []
    
    init() {
        loadStaples()
        updateLists()
    }
    
    func updateFreezerList() {
        freezerList = foodList.filter({ FoodModel -> Bool in
            FoodModel.location.contains("Freezer") && FoodModel.inventory > 0
        })
    }

    func updatePantryList() {
        pantryList = foodList.filter({ FoodModel -> Bool in
            FoodModel.location.contains("Pantry") && FoodModel.inventory > 0
        })
    }

    func updateFridgeList() {
        fridgeList = foodList.filter({ FoodModel -> Bool in
            FoodModel.location.contains("Fridge") && FoodModel.inventory > 0
        })
    }

    func updateShoppingList() {
        shoppingList = foodList.filter({ FoodModel -> Bool in
            if  FoodModel.inventory == 0 {return true}
            else if FoodModel.shopForMore == true {return true}
            else {return false}
        }  )
    }
    
    
    func loadStaples() {
        let food1 = FoodModel(id: UUID().uuidString, location: "Fridge", name: "Milk", inventory: 8, shopForMore: false, expirationDate: "2/22/23")
        let food2 = FoodModel(id: UUID().uuidString, location: "Pantry", name: "Bread", inventory: 1, shopForMore: false, expirationDate: nil)
        let food3 = FoodModel(id: UUID().uuidString, location: "Freezer", name: "Ice Cream", inventory: 2, shopForMore: false, expirationDate: nil)
        let food4 = FoodModel(id: UUID().uuidString, location: "Pantry", name: "Rice", inventory: 2, shopForMore: false, expirationDate: nil)
        self.foodList.append(contentsOf: [food1, food2, food3, food4])
    }
    
    func addFood(id: String, location: String, name: String, inventory: Int, shopForMore: Bool, expirationDate: String?) {
        let newFood = FoodModel(id: id, location: location, name: name, inventory: inventory, shopForMore: shopForMore, expirationDate: expirationDate)
        self.foodList.append(newFood)
        updateLists()
    }
    
    func deleteFood(indexSet: IndexSet) {
        foodList.remove(atOffsets: indexSet)
    }
    
    func deleteShoppingFood(indexSet: IndexSet) {
        shoppingList.remove(atOffsets: indexSet)
        
    }
    
    func deleteFridgeFood(indexSet: IndexSet) {
        fridgeList.remove(atOffsets: indexSet)
    }
    
    func deleteFreezerFood(indexSet: IndexSet) {
        freezerList.remove(atOffsets: indexSet)
    }
    
    func deletePantryFood(indexSet: IndexSet) {
        pantryList.remove(atOffsets: indexSet)
    }
    
    
    func updateLists() {
        updateFridgeList()
        updateShoppingList()
        updateFreezerList()
        updatePantryList()
    }

}
