//
//  FridgeListView.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 2/1/23.
//

import SwiftUI

struct FridgeListView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State var sheetIsToggeled: Bool = false
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                HStack {
                    HStack {
                        Text("Fridge List")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        .background(.thickMaterial)
                        Spacer()
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.accentColor)
                            .padding()
                            .padding(5)
                            .onTapGesture {
                                sheetIsToggeled.toggle()
                            }
                            .sheet(isPresented: $sheetIsToggeled) {
                                AddItemSheet1().presentationDetents([.medium]).presentationDragIndicator(.visible)
                            }
                    }
                    
                }
                List {
                    ForEach(vm.fridgeList) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text(
                                String("\(item.inventory)")
                                )
                        }
                        .foregroundColor(item.inventory > 3 ? Color.primary : Color.red)
                    }
                    .onDelete(perform: vm.deleteFridgeFood)
                }
            }
        }
        .background(.thinMaterial)

    }
}

struct FridgeListView_Previews: PreviewProvider {
    static var previews: some View {
        FridgeListView().environmentObject(ViewModel())
    }
}
