import AppKit

final class MenuBarIconGenerator {
    
    static func generateIcon(
        text: String,
        font: NSFont = .systemFont(ofSize: 10, weight: .medium)
    ) -> NSImage {
        let image = NSImage(size: NSSize(width: 66, height: 22), flipped: false) { rect in
            
            let style = NSMutableParagraphStyle()
            style.alignment = .right
            style.maximumLineHeight = 10
//            style.paragraphSpacing = -5
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
//                .baselineOffset: 0,
                .paragraphStyle: style
            ]
            
            
            let textSize = text.size(withAttributes: attributes)
            let textRect = NSRect(
                x: /*(rect.width - textSize.width) / 2*/ 0,
                y: (rect.height - textSize.height) / 2 - 1.5,
                width: /*textSize.width*/ 66,
                height: textSize.height
            )
            
            text.draw(in: textRect, withAttributes: attributes)
            return true
        }
        
        image.isTemplate = true
        return image
    }
}
