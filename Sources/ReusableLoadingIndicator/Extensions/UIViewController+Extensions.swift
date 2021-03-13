//
//  UIViewController+Extensions.swift
//  ReusableLoadingIndicator
//
//  Created by Alexander Karaatanasov on 13.03.21.
//

import UIKit

extension UIViewController {
    
    static var topMostController: UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        var topController = keyWindow?.rootViewController
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }
        return topController
    }
    
}
