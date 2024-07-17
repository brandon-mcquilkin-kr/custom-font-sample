//
//  CustomModifierView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI

struct FontModifier: ViewModifier {

    enum UseCase {
        case paragraph
        case headline
    }

    enum Weight {
        case light
        case regular
        case heavy
    }

    @Environment(\.legibilityWeight) var legibilityWeight

    var useCase: UseCase
    var weight: Weight

    init(_ useCase: UseCase, _ weight: Weight) {
        self.useCase = useCase
        self.weight = weight
    }

    var resolvedHeadlineWeight: String {
        let resolvedLegibilityWeight = legibilityWeight ?? .regular

        switch weight {
        case .light:
            switch resolvedLegibilityWeight {
            case .regular:
                return "Light"
            case .bold:
                return "Semibold"
            @unknown default:
                return "Light"
            }
        case .regular:
            switch resolvedLegibilityWeight {
            case .regular:
                return "Regular"
            case .bold:
                return "Bold"
            @unknown default:
                return "Regular"
            }
        case .heavy:
            switch resolvedLegibilityWeight {
            case .regular:
                return "Heavy"
            case .bold:
                return "Black"
            @unknown default:
                return "Heavy"
            }
        }
    }

    var resolvedParagraphWeight: Font.Weight {
        switch weight {
        case .light:
            return .light
        case .regular:
            return .regular
        case .heavy:
            return .heavy
        }
    }

    var resolvedFont: Font {
        switch useCase {
        case .paragraph:
            return .system(.largeTitle).weight(resolvedParagraphWeight)

        case .headline:
            return .custom("Overpass-\(resolvedHeadlineWeight)", size: 34, relativeTo: .largeTitle)
        }
    }

    func body(content: Content) -> some View {
        content
            .font(resolvedFont)
    }

}

struct CustomModifierView: View {
    var body: some View {

            VStack {
                Text("This method introduces a conflicting API to Apple's `fontWeight(...)` API. Dynamic type size works correctly. Legibility weight works correctly. `.fontWeight(...) is not able to be supported.")
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
                            .modifier(FontModifier(.paragraph, .regular))
                        Text("Aa")
                            .modifier(FontModifier(.paragraph, .heavy))

                        Text("Aa")
                            .modifier(FontModifier(.headline, .regular))
                        Text("Aa")
                            .modifier(FontModifier(.headline, .heavy))
                    }
                }
                .font(.largeTitle)

                
            }
            .navigationTitle("Legibility Weight Test")

    }
}

#Preview {
    CustomModifierView()
}

