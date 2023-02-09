//
//  ViewModel.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/29/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var foodList: [FoodModel] = []
//    @Published var freezerList: [FoodModel] = []
//    @Published var pantryList: [FoodModel] = []
//    @Published var fridgeList: [FoodModel] = []
//    @Published var shoppingList: [FoodModel] = []
    
    init() {
        loadStaples()
      //  updateLists()
    }
    
//    func updateFreezerList() {
//        freezerList = foodList.filter({ FoodModel -> Bool in
//            FoodModel.location.contains("Freezer")
//        })
//    }
//
//    func updatePantryList() {
//        pantryList = foodList.filter({ FoodModel -> Bool in
//            FoodModel.location.contains("Pantry")
//        })
//    }
//
//    func updateFridgeList() {
//        fridgeList = foodList.filter({ FoodModel -> Bool in
//            FoodModel.location.contains("Fridge")
//        })
//    }
//
//    func updateShoppingList() {
//        shoppingList = foodList.filter({ FoodModel -> Bool in
//            FoodModel.inventory < 3
//        })
//    }
    
    
    func loadStaples() {
        let food1 = FoodModel(id: UUID().uuidString, location: "Fridge", name: "Milk", inventory: 8, shopForMore: true, expirationDate: "2/22/23")
        let food2 = FoodModel(id: UUID().uuidString, location: "Pantry", name: "Bread", inventory: 1, shopForMore: true, expirationDate: nil)
        let food3 = FoodModel(id: UUID().uuidString, location: "Freezer", name: "Ice Cream", inventory: 2, shopForMore: false, expirationDate: nil)
        let food4 = FoodModel(id: UUID().uuidString, location: "Pantry", name: "Rice", inventory: 2, shopForMore: false, expirationDate: nil)
        self.foodList.append(contentsOf: [food1, food2, food3, food4])
    }
    
    func addFood(id: String, location: String, name: String, inventory: Int, shopForMore: Bool, expirationDate: String?) {
        let newFood = FoodModel(id: id, location: location, name: name, inventory: inventory, shopForMore: shopForMore, expirationDate: expirationDate)
        self.foodList.append(newFood)
       // updateLists()
    }
    
    func deleteFood(indexSet: IndexSet) {
        foodList.remove(atOffsets: indexSet)
    }
    
//    func updateLists() {
//        updateFridgeList()
//        updateShoppingList()
//        updateFreezerList()
//        updatePantryList()
//    }

}
