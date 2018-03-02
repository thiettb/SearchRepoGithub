//
//  Result.swift
//  WebserviceDemo
//
//  Created by ThietTB on 3/1/18.
//  Copyright © 2018 bipbipdinang. All rights reserved.
//

import Foundation

struct Result: Decodable {
    var total_count: Int
    var incomplete_results: Bool
    var items: [Items?]
    
    private enum CodingKeys: String, CodingKey {
        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
    }
}

struct Items: Decodable {
    var full_name: String?
    var description: String?

    private enum CodingKeys: String, CodingKey {
        case full_name = "full_name"
        case description = "description"
    }
}

