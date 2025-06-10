//
//  UIApplication+TopViewController.swift
//  GoogleAds
//
//  Created by Jeevith on 5/31/25.
//

import UIKit

extension UIApplication {
    func topViewController(base: UIViewController? = nil) -> UIViewController? {
        let baseVC = base ?? (connectedScenes.first as? UIWindowScene)?
            .windows.first { $0.isKeyWindow }?.rootViewController
        
        if let nav = baseVC as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = baseVC as? UITabBarController {
            return tab.selectedViewController.flatMap { topViewController(base: $0) }
        }
        if let presented = baseVC?.presentedViewController {
            return topViewController(base: presented)
        }
        return baseVC
    }
}
