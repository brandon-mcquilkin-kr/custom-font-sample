//
//  UIFontView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI
import UIKit

extension UIFont {

    static func customWithBoldTextFont() -> UIFont {
        var font = UIFont(name: "Overpass", size: 34)!

        if UIAccessibility.isBoldTextEnabled {
            let descriptor = font.fontDescriptor

            descriptor.withSymbolicTraits(.traitBold)

            font = UIFont(descriptor: descriptor, size: 34)
        }

        return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: font)
    }

}

struct UIFontWithBoldTextView: View {

    var body: some View {

        VStack {
            Text("This method breaks dynamic type size. Bold text does not function correctly. `.fontWeight(...) is not able to be supported.")
                .padding(.bottom, 32)
                .padding(.horizontal)

            Grid(horizontalSpacing: 32) {
                GridRow {
                    Text("")
                    Text("San Fransisco Regular")
                    Text("San Fransisco Bold")
                    Text("Overpass Regular")
                }
                .font(.headline)

                GridRow {
                    Text("UIFont with SwiftUI `fontWeight(...)`")
                        .font(.footnote)
                        .foregroundStyle(.secondary)

                    Text("Aa")
                        .fontWeight(.regular)
                    Text("Aa")
                        .fontWeight(.bold)

                    Text("Aa")
                        .fontWeight(.regular)
                        .font(Font(UIFont.customWithBoldTextFont()))
                }
            }
            .font(.largeTitle)
        }
        .navigationTitle("Legibility Weight Test")
    }

}

#Preview {
    UIFontWithBoldTextView()
}
