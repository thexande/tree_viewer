final class NodeFactory {
    func nodes() -> [Node] {
        return [
            .init(value: "💰 Offers", children: [
                .init(value: "🍦 Ice Cream", children: [
                    .init(value: "💵 $0.24 back")
                ]),
                .init(value: "☕️ Coffee", children: [
                    .init(value: "💵 $0.75 back")
                ]),
                .init(value: "🍔 Burger", children: [
                    .init(value: "💵 $1.00 back")
                ])
            ]),
            .init(value: "Retailers", children: [
                .init(value: "King Soopers"),
                .init(value: "Walmart"),
                .init(value: "Target"),
            ])
        ]
    }
}
