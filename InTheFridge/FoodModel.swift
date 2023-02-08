//
//  FoodModel.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/29/23.
//

import Foundation


struct FoodModel: Identifiable {
    let id: String
    let location: String
    let name: String
    let inventory: Int
    let shopForMore: Bool
    let expirationDate: String?
}
