//
//  APIRequest.swift
//  APIRequest
//
//  Created by 山下優樹 on 2020/04/26.
//  Copyright © 2020 Yuki Yamashita. All rights reserved.
//

public struct API {
    
    public static func request(completion: @escaping  (String) -> Void) {
        // 文字数が1〜9文字の範囲でランダムに返ってくる
        let url = "https://httpbin.org/range/\(Int.random(in: 1..<10))"
        
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: url)!) { data, urlResponse, error in
            
            let body = String(data: data!, encoding: .utf8)!
            completion(body)
        }
        
        task.resume()
    }
}
