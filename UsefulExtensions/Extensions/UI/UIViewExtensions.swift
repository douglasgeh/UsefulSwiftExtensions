//
//  UIViewExtensions.swift
//  UsefulExtensions
//
//  Created by Douglas Gehring on 16/11/20.
//  Copyright © 2020 Douglas Gehring. All rights reserved.
//

import UIKit

public extension UIView {
    func removeSubView(withTag tag: Int) {
        self.subviews.forEach { subView in
            if subView.tag == tag {
                subView.removeFromSuperview()
            }
        }
    }
}
