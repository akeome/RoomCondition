//
//  ViewController.swift
//  RoomCondition
//
//  Created by 山下優樹 on 2020/04/26.
//  Copyright © 2020 Yuki Yamashita. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = URL(string: "http://192.168.100.50:1201/dashboard")
        if let url = url {
            let safari = SFSafariViewController(url: url)
            present(safari, animated: false)
        }
    }
}
