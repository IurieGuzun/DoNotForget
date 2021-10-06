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
    }
    @IBAction func onDateTapped() {
        print("Date")
    }
    @IBAction func onLocationTapped() {
        print("Location")
    }
    
    
}

