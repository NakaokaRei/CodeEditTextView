import XCTest
@testable import CodeEditTextView
import SwiftTreeSitter
import AppKit

final class STTextViewControllerTests: XCTestCase {

    var controller: STTextViewController!
    var theme: EditorTheme!

    override func setUpWithError() throws {
        theme = EditorTheme(
            text: .textColor,
            insertionPoint: .textColor,
            invisibles: .gray,
            background: .textBackgroundColor,
            lineHighlight: .highlightColor,
            selection: .selectedTextColor,
            keywords: .systemPink,
            commands: .systemBlue,
            types: .systemMint,
            attributes: .systemTeal,
            variables: .systemCyan,
            values: .systemOrange,
            numbers: .systemYellow,
            strings: .systemRed,
            characters: .systemRed,
            comments: .systemGreen
        )
        controller = STTextViewController(
            text: .constant(""),
            language: .default,
            font: .monospacedSystemFont(ofSize: 11, weight: .medium),
            theme: theme,
            tabWidth: 4
        )
    }

    func test_captureNames() throws {
        // test for "keyword"
        let captureName1 = "keyword"
        let color1 = controller.attributesFor(CaptureName(rawValue: captureName1))[.foregroundColor] as? NSColor
        XCTAssertEqual(color1, NSColor.systemPink)

        // test for "comment"
        let captureName2 = "comment"
        let color2 = controller.attributesFor(CaptureName(rawValue: captureName2))[.foregroundColor] as? NSColor
        XCTAssertEqual(color2, NSColor.systemGreen)

        /* ... additional tests here ... */

        // test for empty case
        let captureName3 = ""
        let color3 = controller.attributesFor(CaptureName(rawValue: captureName3))[.foregroundColor] as? NSColor
        XCTAssertEqual(color3, NSColor.textColor)

        // test for random case
        let captureName4 = "abc123"
        let color4 = controller.attributesFor(CaptureName(rawValue: captureName4))[.foregroundColor] as? NSColor
        XCTAssertEqual(color4, NSColor.textColor)
    }

}
