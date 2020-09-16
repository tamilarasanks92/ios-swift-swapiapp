//
//  UITableView+Animate.swift
//  SWAPIApp
//
//  Created by aspire on 9/16/20.
//  Copyright © 2020 aspire. All rights reserved.
//

import Foundation
import UIKit

/**
Custom extension to animate UILabel based on direction and duration

- Parameters:
 - direction: Label will be animate based on the direction. Default value is Left
 - duration: Duration of the animation. Default value is 1.0
 - delay: How delay the animation should start. Default value is 0.0
*/

extension UITableView {
    func easeoutAnimation(from direction: VerticalDirections = .Bottom, within duration: TimeInterval = 1.0, after delay: TimeInterval = 0.0) {
        if direction == .Bottom {
            self.center.y += super.bounds.height
        } else {
            self.center.y -= super.bounds.height
        }
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseOut], animations: {
            if direction == .Bottom {
                self.center.y -= super.bounds.height
            } else {
                self.center.y += super.bounds.height
            }
        }, completion: nil)
    }
}
