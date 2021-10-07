//
//  ViewController.swift
//  DoNotForget
//
//  Created by Iurie Guzun on 2021-10-06.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNService.shared.authorize()
    }

    @IBAction func onTimeTapped() {
        print("Time")
        UNService.shared.timeRequest(with: 5)
    }
    @IBAction func onDateTapped() {
        print("Date")
        var components = DateComponents()
        components.second = 0
        UNService.shared.dateRequest(with: components)
    }
    @IBAction func onLocationTapped() {
        print("Location")
    }
    
    
}

