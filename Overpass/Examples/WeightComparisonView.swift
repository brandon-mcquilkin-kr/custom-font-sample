//
//  WeightComparisonView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI

struct WeightComparisonView: View {

    var body: some View {
        VStack {
            Text("We have figured out how to modify the custom font in a way that the font weight API works as expected when accessibility features are not enabled.")
                .padding(.bottom, 32)
                .padding(.horizontal)

            Grid(horizontalSpacing: 32) {
                GridRow {
                    Text("San Fransisco")
                    Text("Overpass")
                    Text("Overpass")
                    Text("Overpass")
                }
                .font(.headline)

                GridRow {
                    Text("Font weight via modifier")
                    Text("Font weight via name")
                    Text("Font weight via modifier")
                    Text("Overlay comparison")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)

                GridRow {
                    Text("#100")
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)

                    Text("#100")
                        .font(.custom("Overpass-UltraLight", size: 34, relativeTo: .largeTitle))

                    Text("#100")
                        .fontWeight(.ultraLight)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#100")
                            .font(.custom("Overpass-UltraLight", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#100")
                            .fontWeight(.ultraLight)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#200")
                        .font(.largeTitle)
                        .fontWeight(.thin)

                    Text("#200")
                        .font(.custom("Overpass-Thin", size: 34, relativeTo: .largeTitle))

                    Text("#200")
                        .fontWeight(.thin)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#200")
                            .font(.custom("Overpass-Thin", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#200")
                            .fontWeight(.thin)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#100")
                        .font(.largeTitle)
                        .fontWeight(.light)

                    Text("#300")
                        .font(.custom("Overpass-Light", size: 34, relativeTo: .largeTitle))

                    Text("#300")
                        .fontWeight(.light)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#300")
                            .font(.custom("Overpass-Light", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#300")
                            .fontWeight(.light)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#400")
                        .font(.largeTitle)
                        .fontWeight(.regular)

                    Text("#400")
                        .font(.custom("Overpass-Regular", size: 34, relativeTo: .largeTitle))

                    Text("#400")
                        .fontWeight(.regular)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#400")
                            .font(.custom("Overpass-Regular", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#400")
                            .fontWeight(.regular)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#500")
                        .font(.largeTitle)
                        .fontWeight(.medium)

                    Text("#500")
                        .font(.custom("Overpass-Medium", size: 34, relativeTo: .largeTitle))

                    Text("#500")
                        .fontWeight(.medium)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#500")
                            .font(.custom("Overpass-Medium", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#500")
                            .fontWeight(.medium)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#500")
                        .font(.largeTitle)
                        .fontWeight(.semibold)

                    Text("#600")
                        .font(.custom("Overpass-Semibold", size: 34, relativeTo: .largeTitle))

                    Text("#600")
                        .fontWeight(.semibold)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#600")
                            .font(.custom("Overpass-Semibold", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#600")
                            .fontWeight(.semibold)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#700")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("#700")
                        .font(.custom("Overpass-Bold", size: 34, relativeTo: .largeTitle))

                    Text("#700")
                        .fontWeight(.bold)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#700")
                            .font(.custom("Overpass-Bold", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#700")
                            .fontWeight(.bold)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#800")
                        .font(.largeTitle)
                        .fontWeight(.heavy)

                    Text("#800")
                        .font(.custom("Overpass-Heavy", size: 34, relativeTo: .largeTitle))

                    Text("#800")
                        .fontWeight(.heavy)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#800")
                            .font(.custom("Overpass-Heavy", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#800")
                            .fontWeight(.heavy)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }

                GridRow {
                    Text("#900")
                        .font(.largeTitle)
                        .fontWeight(.black)

                    Text("#900")
                        .font(.custom("Overpass-Black", size: 34, relativeTo: .largeTitle))

                    Text("#900")
                        .fontWeight(.black)
                        .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))

                    ZStack {
                        Text("#900")
                            .font(.custom("Overpass-Black", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.blue)

                        Text("#900")
                            .fontWeight(.black)
                            .font(.custom("Overpass", size: 34, relativeTo: .largeTitle))
                            .foregroundStyle(.red)
                    }
                }
            }

            Divider()

            Text("""
                 Notes:

                 * The font style name metadata needs to be modified to match the name the `.fontWeight(...)` API expects.
                     * Use [Typelight](https://cr8software.net/typelight.html)
                         * Modify this value: Menu > Font > Description, adjust the named weight specified in the picker.
                         * Rename the font: Menu > Font > Names. Adust the main font name and weight name.
                 * The font weight value (100/200/300) needs to be modified so that the underlying weight value matches the value the .fontWeight API expects. See [here](https://matthewcodes.uk/articles/custom-fonts-with-swiftui/).
                     * Use [Typelight](https://cr8software.net/typelight.html)
                         * Modify this value: Menu > Font > Description, adjust the named weight specified in the picker. You will need to adjust and test, values may need to be adjusted up or down.

                 """)
                .foregroundStyle(.secondary)
                .font(.footnote)
                .padding()
        }
        .navigationTitle("Test Loading by Weight")
    }

}

#Preview {
    WeightComparisonView()
}
