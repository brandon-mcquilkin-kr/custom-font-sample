//
//  ContentView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.legibilityWeight) var legibilityWeight

    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    WeightComparisonView()
                } label: {
                    Text("Font Weight Test")
                }

                NavigationLink {
                    StandardLegibilityWeightView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Legibility Weight Test")
                        Text("Standard `fontWeight(...)` API")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }

                NavigationLink {
                    UIFontView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Legibility Weight Test")
                        Text("`UIFont` with standard `fontWeight(...)` API")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }

                NavigationLink {
                    UIFontWithBoldTextView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Legibility Weight Test")
                        Text("`UIFont` with `UIAccessibility` check")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }

                NavigationLink {
                    CustomModifierView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Custom Modifier")
                        Text("Use a modifier instead of `.font(..)` and `.fontWeight(...)`")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }

                NavigationLink {
                    FontEnvironmentKeyRetrievalView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Font Environment Key")
                        Text("Can the font weight be extracted from the font environment key?")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }

                NavigationLink {
                    EnvironmentRetrievalView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Environment Internals")
                        Text("Can the font weight be extracted from the environment internals?")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Custom Font Test")
        }
    }
}

#Preview {
    ContentView()
}
