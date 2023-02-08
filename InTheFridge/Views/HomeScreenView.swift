//
//  HomeScreenView.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 2/1/23.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack {
            Text("Welcome to Fridgest! Start by adding an item to your shopping list!") .multilineTextAlignment(.center)
                .font(.headline)
                .frame(width: 300)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            Button {
                
            } label: {
                Text("Tap here to get started!")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
