//
//  UIFontView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI
import UIKit

extension UIFont {

    static func customFont() -> UIFont {
        let font = UIFont(name: "Overpass", size: 34)!
        return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: font)
    }

}

struct UIFontView: View {

    var body: some View {

        VStack {
            Text("This method breaks dynamic type size. Bold text still does not function correctly. `.fontWeight(...) still functions correctly.")
                .padding(.bottom, 32)
                .padding(.horizontal)

            Grid(horizontalSpacing: 32) {
                GridRow {
                    Text("")
                    Text("San Fransisco Regular")
                    Text("San Fransisco Bold")
                    Text("Overpass Regular")
                    Text("Overpass Bold")
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
                        .font(Font(UIFont.customFont()))
                    Text("Aa")
                        .fontWeight(.bold)
                        .font(Font(UIFont.customFont()))
                }
            }
            .font(.largeTitle)
        }
        .navigationTitle("Legibility Weight Test")
    }

}

#Preview {
    UIFontView()
}
