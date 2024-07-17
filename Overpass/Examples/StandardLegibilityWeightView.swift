//
//  StandardLegibilityWeightView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI

struct StandardLegibilityWeightView: View {

    var body: some View {

        VStack {
            Text("Note that when using the standard `fontWeight(...)` API and enabling the Bold text accessibility feature, the custom font does not change weights.")
                .padding(.bottom, 32)
                .padding(.horizontal)

            Grid(horizontalSpacing: 32) {
                GridRow {
                    Text("San Fransisco Regular")
                    Text("San Fransisco Bold")
                    Text("Overpass Regular")
                    Text("Overpass Bold")
                }
                .font(.headline)

                GridRow {
                    Text("Aa")
                        .fontWeight(.regular)
                    Text("Aa")
                        .fontWeight(.bold)

                    Text("Aa")
                        .fontWeight(.regular)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                    Text("Aa")
                        .fontWeight(.bold)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                }
            }
            .font(.largeTitle)
        }
        .navigationTitle("Legibility Weight Test")
    }
    
}

#Preview {
    StandardLegibilityWeightView()
}
