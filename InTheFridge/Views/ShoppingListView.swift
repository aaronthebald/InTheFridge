//
//  ShoppingListView.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 2/1/23.
//

import SwiftUI

struct ShoppingListView: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                Text("Shopping List")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.thickMaterial)
                row
                
            }
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView().environmentObject(ViewModel())
    }
}

extension ShoppingListView {
    private var row: some View {
        
        List {
            ForEach(vm.shoppingList) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(
                        String("\(item.inventory)")
                        )
                }
                .foregroundColor(item.inventory > 3 ? Color.primary : Color.red)

            }
        }
        
    }
}

