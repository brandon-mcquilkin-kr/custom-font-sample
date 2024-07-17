//
//  FontEnvironmentKeyRetrievalView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI

struct DumpFontTest: View {

    @Environment(\.font) var font

    var body: some View {
        Text("San Fransisco")
            .onAppear {
                print("------------")
                dump(font)
            }
    }

}

struct FontEnvironmentKeyRetrievalView: View {
    var body: some View {
        VStack {
            Text("`.fontWeight(...)` is not reflected in the `font` environment value. Weights included directly on the font are included.")
            DumpFontTest()
                .font(.largeTitle)
                .fontWeight(.heavy)

            DumpFontTest()
                .font(.largeTitle.weight(.light))
        }
        .navigationTitle("Extract ")
    }
}

#Preview {
    FontEnvironmentKeyRetrievalView()
}
