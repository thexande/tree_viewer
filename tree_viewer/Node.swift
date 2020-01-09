import Foundation

@objc public class Node: NSObject {

    @objc let value: String
    @objc var children: [Node]

    @objc var childrenCount: String? {
        let count = children.count
        guard count > 0 else { return nil }
        return "\(count) node\(count > 1 ? "s" : "")"
    }

    @objc var count: Int {
        children.count
    }

    @objc var isLeaf: Bool {
        children.isEmpty
    }

    init(value: String, children: [Node] = []) {
        self.value = value
        self.children = children
    }
}
