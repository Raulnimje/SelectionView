import UIKit
import Foundation

struct Images {
    static let board: UIImage = UIImage(named: "board_icon.png")!
    static let file: UIImage = UIImage(named: "file_icon.png")!
    static let hand: UIImage = UIImage(named: "hand_icon.png")!
    static let shoe: UIImage = UIImage(named: "shoe_icon.png")!
    static let temp: UIImage = UIImage(named: "temp_icon.png")!
}

extension UIImage {
    // ease to tint images given a color
    // also find here https://gist.github.com/cristhianleonli/5aba25ee06be0844d42dbbb452ccd67b
    func tintedImage(imageColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        context?.setBlendMode(.normal)
        context?.fill(rect)
        
        context?.setBlendMode(.normal)
        if let cgImage = cgImage {
            context?.draw(cgImage, in: rect)
            
            context?.setBlendMode(.sourceAtop)
            imageColor.setFill()
            context?.fill(rect)
            
            context?.setBlendMode(.destinationIn)
            context?.draw(cgImage, in: rect)
            
            let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return tintedImage ?? self
        }
        return self
    }
}
