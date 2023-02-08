//
//  Section View.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/29/23.
//

import SwiftUI

struct SectionView: View {
    @State var image: Image
    @State var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
            Spacer()
               image
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(image: Image(systemName: "snowflake.circle.fill"), title: "Freezer")
    }
}
