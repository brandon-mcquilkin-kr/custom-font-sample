//
//  EnvironmentRetrievalView.swift
//  Overpass
//
//  Created by Brandon McQuilkin on 6/24/24.
//

import SwiftUI

/// Extracts a value from the environment by the name of its associated EnvironmentKey.
/// Can be used to grab private environment values such as foregroundColor ("ForegroundColorKey").
func extractEnvironmentValue(env: EnvironmentValues) -> Float? {

    func keyFromTypeName(typeName: String) -> String? {
        let expectedPrefix = "TypedElement<EnvironmentPropertyKey<"
        guard typeName.hasPrefix(expectedPrefix) else {
            return nil
        }
        let rest = typeName.dropFirst(expectedPrefix.count)
        let expectedSuffix = ">>"
        guard rest.hasSuffix(expectedSuffix) else {
            return nil
        }
        let middle = rest.dropLast(expectedSuffix.count)

        return String(middle)
    }

    /// `environmentMember` has type (for example) `TypedElement<EnvironmentPropertyKey<ForegroundColorKey>>`
    /// TypedElement.value contains the value of the key.
    func extract(startingAt environmentNode: Any) -> Float? {
        let mirror = Mirror(reflecting: environmentNode)

        let typeName = String(describing: type(of: environmentNode))
        print(typeName)

        if let nodeKey = keyFromTypeName(typeName: typeName) {
            if "FontModifiersKey" == nodeKey {
                var contents: String = ""
                dump(mirror.descendant("value"), to: &contents)

                let matches = contents.matches(of: /- value: (\d*\.\d*)/)

                guard matches.count == 1 else {
                    print("Encountered multiple font weight value matches in the font modifier object. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
                    return nil
                }

                let stringValue = matches[0].output.1
                guard let floatValue = Float(stringValue) else {
                    print("Unable to convert the font weight value to a Float. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
                    return nil
                }

                return floatValue
            }
        } else {
            print("Encountered type '\(typeName)' in environment, but expected 'TypedElement<EnvironmentPropertyKey<…>>'. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
            return nil
        }

        // Environment values are stored in a doubly linked list. The "before" and "after" keys point
        // to the next environment member.
        if let linkedListMirror = mirror.superclassMirror,
           let nextNode = linkedListMirror.descendant("after", "some") {
            return extract(startingAt: nextNode)
        }

        return nil
    }

    let mirror = Mirror(reflecting: env)

    if let firstEnvironmentValue = mirror.descendant("_plist", "elements", "some") {
        return extract(startingAt: firstEnvironmentValue)
    } else if let firstEnvironmentValue = mirror.descendant("plist", "elements", "some") {
        return extract(startingAt: firstEnvironmentValue)
    } else {
        print("No first environment value. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
        return nil
    }
}

@propertyWrapper struct FontWeightExtract {
    final class Store: ObservableObject {
        var value: Font.Weight = .regular
    }

    @Environment(\.self) private var env
    // `wrappedValue.set` must be nonmutating, so we need some kind of external storage for the value.
    // Not sure this is the best way. I tried using `@State`, but that crashes. `@StateObject` is
    // convenient but we don't actually need Store to be an ObservableObject. 🤷‍♂️
    @StateObject private var store: Store = Store()

    private(set) var wrappedValue: Font.Weight {
        get { store.value }
        nonmutating set { store.value = newValue }
    }
}

extension FontWeightExtract: DynamicProperty {

    static let fontWeightLookup: [Float: Font.Weight] = [
        -0.8: .ultraLight,
         -0.6: .thin,
         -0.4: .light,
         0: .regular,
         0.23: .medium,
         0.3: .semibold,
         0.4: .bold,
         0.56: .heavy,
         0.62: .black
    ]

    func update() {
        print("Updating...")
        var weightFloatValue: Float? = extractEnvironmentValue(env: env)

        guard let weightFloatValue else {
            wrappedValue = .regular
            return
        }

        guard let weight = FontWeightExtract.fontWeightLookup[weightFloatValue] else {
            print("No font weight match in the weight lookup table. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
            wrappedValue = .regular
            return
        }

        return wrappedValue = weight
    }

}

struct CustomFontViewModifier: ViewModifier {

    @FontWeightExtract var fontWeight: Font.Weight
    @Environment(\.legibilityWeight) var legibilityWeight

    func resolvedFontWeight() -> Font.Weight {
        if let legibilityWeight = legibilityWeight {
            switch legibilityWeight {
            case .regular:
                break
            case .bold:
                switch fontWeight {
                case .ultraLight:
                    return .regular
                case .thin:
                    return .medium
                case .light:
                    return .semibold
                case .regular:
                    return .bold
                case .medium:
                    return .heavy
                case .semibold:
                    return .black
                case .bold:
                    return .black
                case .heavy:
                    return .black
                case .black:
                    return .black
                default:
                    print("Unknown font weight. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
                    return .regular
                }
            @unknown default:
                print("Unknown legibility weight. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
                return .regular
            }
        }

        return fontWeight
    }

    func body(content: Content) -> some View {
        content
            .fontWeight(resolvedFontWeight())
    }

}

fileprivate let fontSizeTable: [Font.TextStyle: CGFloat] = [
    .largeTitle: 34.0,
    .title: 28,
    .title2: 22,
    .title3: 20,
    .headline: 17,
    .body: 17,
    .callout: 16,
    .subheadline: 15,
    .footnote: 13,
    .caption: 12,
    .caption2: 11
]

extension View {

    private func resolvedFontSize(style: Font.TextStyle) -> CGFloat {
        guard let size = fontSizeTable[style] else {
            print("Unknown text style. The type hierarchy may have changed in your SwiftUI version. Font weight accessibility is broken for custom fonts.")
            return fontSizeTable[.body]!
        }

        return size
    }

    func customFont(_ style: Font.TextStyle) -> some View {
        self
            .font(.custom("Overpass", size: resolvedFontSize(style: style), relativeTo: style))
            .modifier(CustomFontViewModifier())
    }

}

struct EnvironmentRetrievalView: View {

    var body: some View {
        VStack {
            Text("Regular Custom Font")
                .customFont(.largeTitle)

            Text("Bold Custom Font")
                .customFont(.largeTitle)
                .fontWeight(.bold)

            Divider()

            Text("""
                 To retrieve the font weight from the environment:

                 - The private font modifier key needs to be found and the object dumped into a string.
                 - Regex is used to extract the value of the weight modifier.
                 - The weight modifier is then mapped to a named font weight.
                 - The font weight is adjusted as needed based on the bold font setting.
                 - This is probably not very performant. This modifier should probably do a check to see if the lookup is necessary through using a sub-view, then only apply the modifier as needed.

                 """)
            .font(.footnote)
            .foregroundStyle(.secondary)
            .padding()
        }
    }

}

#Preview {
    EnvironmentRetrievalView()
}
