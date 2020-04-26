//
//  RoomCondition.swift
//  APIRequest
//
//  Created by 山下優樹 on 2020/04/26.
//  Copyright © 2020 Yuki Yamashita. All rights reserved.
//

import Foundation

public struct RoomCondition: Codable {
    public let co2: String
    public let temp: String
    public let timestamp: String
}
