import Cocoa

final class ViewController: NSViewController {
    @IBOutlet weak var outlineView: NSOutlineView!
    private let treeController = NSTreeController()
    @objc dynamic var content = [Node]()

    override func viewDidLoad() {
        super.viewDidLoad()

        outlineView.delegate = self

        treeController.objectClass = Node.self
        treeController.childrenKeyPath = "children"
        treeController.countKeyPath = "count"
        treeController.leafKeyPath = "isLeaf"

        outlineView.gridStyleMask = .solidHorizontalGridLineMask
        outlineView.autosaveExpandedItems = true

        treeController.bind(NSBindingName(rawValue: "contentArray"),
                            to: self,
                            withKeyPath: "content",
                            options: nil)


        outlineView.bind(NSBindingName(rawValue: "content"),
                         to: treeController,
                         withKeyPath: "arrangedObjects",
                         options: nil)

        content.append(contentsOf: NodeFactory().nodes())
    }
}

extension ViewController: NSOutlineViewDelegate {
    public func outlineView(_ outlineView: NSOutlineView,
                            viewFor tableColumn: NSTableColumn?,
                            item: Any) -> NSView? {
        var cellView: NSTableCellView?

        guard let identifier = tableColumn?.identifier else { return cellView }

        switch identifier {
        case .init("node"):
            if let view = outlineView.makeView(withIdentifier: identifier,
                                               owner: outlineView.delegate) as? NSTableCellView {
                view.textField?.bind(.value,
                                     to: view,
                                     withKeyPath: "objectValue.value",
                                     options: nil)
                cellView = view
            }
        case .init("count"):
            if let view = outlineView.makeView(withIdentifier: identifier,
                                               owner: outlineView.delegate) as? NSTableCellView {
                view.textField?.bind(.value,
                                     to: view,
                                     withKeyPath: "objectValue.childrenCount",
                                     options: nil)
                cellView = view
            }
        default:
            return cellView
        }
        return cellView
    }
}
