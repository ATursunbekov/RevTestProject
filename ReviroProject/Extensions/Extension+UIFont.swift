//
//  Extension+UIFont.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 5/3/24.
//

import UIKit

enum RobotoWeight {
    case light
    case regular
    case medium
    case bold
    case black
    
    func fontName() -> String {
        switch self {
        case .light:
            return "Roboto-Light"
        case .regular:
            return "Roboto-Regular"
        case .medium:
            return "Roboto-Medium"
        case .bold:
            return "Roboto-Bold"
        case .black:
            return "Roboto-Black"
        }
    }
}

extension UIFont {
    static func getRoboto(size: Int, weight: RobotoWeight) -> UIFont {
        return UIFont(name: weight.fontName(), size: CGFloat(size))!
    }
}
