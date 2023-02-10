//
//  TabViewConcept1.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/31/23.
//

import SwiftUI

struct TabViewConcept1: View {
    @EnvironmentObject var vm: ViewModel
    @State var sheetIsToggled: Bool = false
    var body: some View {
        TabView {
            Button("Click here to get started!", action: {
                sheetIsToggled.toggle()
            }).sheet(isPresented: $sheetIsToggled, content: {
                AddItemSheet1().presentationDetents([.medium]).presentationDragIndicator(.visible)
            })
            .tabItem {
                        Image(systemName: "house.fill")
                    }
            ShoppingListView().tabItem {
                Image(systemName:  "bag")
            }
            FreezerListView().tabItem {
                Image(systemName: "snowflake")
            }
            FridgeListView().tabItem {
                Image(systemName: "refrigerator")
            }
            PantryListView().tabItem {
                Image(systemName: "cabinet")
            }
            
            
        }
        }
    }


struct TabViewConcept1_Previews: PreviewProvider {
    static var previews: some View {
        TabViewConcept1()
            .environmentObject(ViewModel())
    }
}
