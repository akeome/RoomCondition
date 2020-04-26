//
//  TodayViewController.swift
//  RoomConditionTodayExtension
//
//  Created by 山下優樹 on 2020/04/26.
//  Copyright © 2020 Yuki Yamashita. All rights reserved.
//

import UIKit
import NotificationCenter
import APIRequest

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var co2Label: UILabel!
    @IBOutlet private weak var timestampLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        API.request(completion: { roomCondition in
            guard let roomCondition = roomCondition else {
                completionHandler(.failed)
                return
            }
            
            DispatchQueue.main.async {
                self.temperatureLabel.text = roomCondition.temp
                self.co2Label.text = roomCondition.co2
                self.timestampLabel.text = "取得日時: \(roomCondition.timestamp)"

                completionHandler(NCUpdateResult.newData)
            }
        })
    }
    
}
