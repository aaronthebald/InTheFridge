//
//  FoodIcon.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/29/23.
//

import SwiftUI

struct FoodIcon: View {
    var body: some View {
        HStack {
            Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 45)
                .foregroundColor(.accentColor)
                .padding()
            Spacer()
        }
    }
}
struct FoodIcon_Previews: PreviewProvider {
    static var previews: some View {
        FoodIcon()
    }
}
