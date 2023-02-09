//
//  PantryListView.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 2/1/23.
//

import SwiftUI

struct PantryListView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                Text("Pantry List")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.thickMaterial)
                List {
                    ForEach(vm.foodList.filter({ item in
                        item.location.contains("Pantry")
                    })) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text(
                                String("\(item.inventory)")
                            )
                        }
                        .foregroundColor(item.inventory > 3 ? Color.primary : Color.red)
                    }
                    .onDelete(perform: vm.deleteFood)
                }
            }
            
        }
    }
    
    struct PantryListView_Previews: PreviewProvider {
        static var previews: some View {
            PantryListView().environmentObject(ViewModel())
        }
    }
}
