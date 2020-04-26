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
    
    @IBOutlet private weak var temperatureTitleLabel: UILabel!
    @IBOutlet private weak var co2TitleLabel: UILabel!
    @IBOutlet private weak var temperatureBudge: UIView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var co2Budge: UIView!
    @IBOutlet private weak var co2Label: UILabel!
    @IBOutlet private weak var timestampLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TodayExtensionはなぜかstoryboardで設定した色が反映されないのでここで
        temperatureTitleLabel.textColor = .secondaryLabel
        co2TitleLabel.textColor = .secondaryLabel
        timestampLabel.textColor = .secondaryLabel
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
                self.temperatureBudge.backgroundColor = self.tempColor(tempValue: roomCondition.temp)
                self.co2Label.text = roomCondition.co2
                self.co2Budge.backgroundColor = self.co2Color(co2Value: roomCondition.co2)
                self.timestampLabel.text = "取得日時: \(roomCondition.timestamp)"

                completionHandler(NCUpdateResult.newData)
            }
        })
    }
    
    func tempColor(tempValue: String) -> UIColor {
        switch Double(tempValue) {
        case (20.0...26.0)?:
            return .systemGreen
        case (10.0...30.0)?:
            return .systemYellow
        default:
            return .systemRed
        }
    }
    
    func co2Color(co2Value: String) -> UIColor {
        switch Int(co2Value) {
        case (..<1000)?:
            return .systemGreen
        case (..<1200)?:
            return .systemYellow
        default:
            return .systemRed
        }
    }
}
