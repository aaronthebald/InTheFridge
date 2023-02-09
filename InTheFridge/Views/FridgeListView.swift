//
//  FridgeListView.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 2/1/23.
//

import SwiftUI

struct FridgeListView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                HStack {
                    Text("Fridge List")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    .background(.thickMaterial)
                    
                }
                List {
                    ForEach(vm.foodList.filter({ item in
                        item.location.contains("Fridge")
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
}

struct FridgeListView_Previews: PreviewProvider {
    static var previews: some View {
        FridgeListView().environmentObject(ViewModel())
    }
}
