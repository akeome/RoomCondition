//
//  APIRequest.swift
//  APIRequest
//
//  Created by 山下優樹 on 2020/04/26.
//  Copyright © 2020 Yuki Yamashita. All rights reserved.
//

public struct API {
    
    public static func request(completion: @escaping (RoomCondition?) -> Void) {
        
        let url = "http://192.168.100.50:1201/log.json"
        
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: url)!) { data, urlResponse, error in
            
            let currentCondition = try! JSONDecoder().decode([RoomCondition].self, from: data!)
            completion(currentCondition.last)
        }
        
        task.resume()
    }
}
