import XCTest
import Engine
import SwiftUI

final class EngineTests: XCTestCase {

    // Fails: failed - TupleView should conform to MultiView
    func testTupleViewConformance() {
        let tuple = TupleView((Text("Hello"), Text("World")))

        guard let _ = MultiViewProtocolDescriptor.conformance(of: type(of: tuple)) else {
            XCTFail("TupleView should conform to MultiView")
            return
        }
    }

    // Passes
    func testGroupMultiViewConformance() {
        let group = Group {
            Text("Hi")
        }

        guard let _ = MultiViewProtocolDescriptor.conformance(of: type(of: group)) else {
            XCTFail("Group should conform to MultiView")
            return
        }
    }

    // Passes
    func testSectionMultiViewConformance() {
        let section = Section {
            Text("Hi")
        }

        guard let _ = MultiViewProtocolDescriptor.conformance(of: type(of: section)) else {
            XCTFail("Section should conform to MultiView")
            return
        }
    }

    // Fails: XCTAssertEqual failed: ("1") is not equal to ("3")
    func testMultiViewSubviewVisitor_group() {
        let content = Group {
            Text("One")
            Text("Two")
            Text("Three")
        }

        var visitor = MultiViewSubviewVisitor()
        content.visit(visitor: &visitor)

        XCTAssertEqual(visitor.subviews.count, 3)
        print(visitor.subviews)
    }

    // Fails: XCTAssertEqual failed: ("3") is not equal to ("5")
    func testMultiViewSubviewVisitor_section() {
        let content = Section {
            Text("One")
            Text("Two")
            Text("Three")
        } header: {
            Text("Header")
        } footer: {
            Text("Footer")
        }

        var visitor = MultiViewSubviewVisitor()
        content.visit(visitor: &visitor)
        XCTAssertEqual(visitor.subviews.count, 5)
    }
}
