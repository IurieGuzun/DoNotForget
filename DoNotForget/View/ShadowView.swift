//
//  ShadowView.swift
//  DoNotForget
//
//  Created by Iurie Guzun on 2021-10-06.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform: nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1
        layer.shadowRadius = 5
        
        layer.cornerRadius = 5
        
    }
}
