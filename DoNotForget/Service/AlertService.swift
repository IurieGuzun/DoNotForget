//
//  AlertService.swift
//  DoNotForget
//
//  Created by Iurie Guzun on 2021-10-07.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import UIKit

class AlertService {
    private init() {}
    static func actionSheet(in vc: UIViewController, title: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: title, style: .default) { (_) in
            completion()
        }
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
