//
//  Extension.swift
//  WalletDesign
//
//  Created by Admin on 10/11/23.
//

import UIKit

extension UIView {
    func applyShadow(color: UIColor = .black,
                     alpha: Float = 0.1,
                     xOffset: CGFloat = 2,
                     yOffset: CGFloat = 2,
                     spread: CGFloat = 0) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
        layer.shadowRadius = 10
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    func applyDarkGreenToLightGreenGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.lightGreen.cgColor, UIColor.darkGreen.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func addDarkOrangeToLightOrangeGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.lightOrange.cgColor, UIColor.darkOrange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor(red: 0.3, green: 0.65, blue: 0.28, alpha: 1.0).cgColor, UIColor (red: 0.0, green: 0.34, blue: 0.0, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        // Specify color stops
        gradientLayer.locations = [-0.04 as NSNumber, 0.9734 as NSNumber]
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addRoundedBottomCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    func makeRound() {
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
    }
    func applyCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    func applyLinearGradient() {
               let gradientLayer = CAGradientLayer()
               gradientLayer.frame = bounds

               // Define the colors for your gradient
               guard let darkGreen = UIColor(hex: "018652")?.cgColor,
                     let lightGreen = UIColor(hex: "4CA748")?.cgColor else {
                   return
               }

               gradientLayer.colors = [darkGreen, lightGreen]

               // Specify the direction of the gradient (you can customize this)
               let angle: Double = 3.0 // in degrees
               let radians = angle * .pi / 180.0
               let x = cos(radians)
               let y = sin(radians)

               // Use the bounds from self, not the bounds directly
               let gradientBounds = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
               gradientLayer.frame = gradientBounds

               gradientLayer.startPoint = CGPoint(x: CGFloat(0.5 - x), y: CGFloat(0.5 + y))
               gradientLayer.endPoint = CGPoint(x: CGFloat(0.5 + x), y: CGFloat(0.5 - y))

               layer.insertSublayer(gradientLayer, at: 0)
           }
    func addBorder(width: CGFloat, color: UIColor) {
            layer.borderWidth = width
            layer.borderColor = color.cgColor
            }
    
}
extension UIColor {
    static var darkGreen: UIColor {
        return UIColor(red: 0.0, green: 0.2, blue: 0.0, alpha: 0.70)
    }
    
    static var lightGreen: UIColor {
        return UIColor(red: 0.0, green: 0.60, blue: 0.0, alpha: 1.0)
    }
    static var darkOrange: UIColor {
        return UIColor(red: 1.0, green: 0.849, blue: 0.0, alpha: 1.0)
    }
    static var lightOrange: UIColor {
        return UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0)
    }
    convenience init?(hex: String) {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

            var rgb: UInt64 = 0

            guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
                return nil
            }

            let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgb & 0x0000FF) / 255.0

            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        
    }
    
}

