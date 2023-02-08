//
//  ContentView.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    
   @StateObject var vm: ViewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                

                SectionView(image: Image(systemName: "snowflake.circle.fill"), title: "Freezer")
                SectionView(image: Image(systemName: "snowflake.circle.fill"), title: "Pantry")
                SectionView(image: Image(systemName: "snowflake.circle.fill"), title: "Fridge")

            }
            .navigationTitle("What's in the fridge?")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


