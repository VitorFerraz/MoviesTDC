
import SnapshotTesting
import SwiftUI

extension Snapshotting where Value: SwiftUI.View, Format == UIImage {

    static func image(
        drawHierarchyInKeyWindow: Bool = false,
        precision: Float = 1,
        size: CGSize? = nil,
        traits: UITraitCollection = .init()
    ) -> Snapshotting {
        Snapshotting<UIViewController, UIImage>.image(
            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
            precision: precision,
            size: size,
            traits: traits
        )
        .pullback(UIHostingController.init(rootView:))
    }
}
