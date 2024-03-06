//
//  Extension+NSObject.swift
//  ReviroProject
//
//  Created by Alikhan Tursunbekov on 6/3/24.
//

import UIKit

extension NSObject {
    func dWidth(_ width: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.width * width / 430
    }
    
    func dHeight(_ height: CGFloat) -> CGFloat {
        return UIScreen.main.bounds.height * height / 932
    }
}
