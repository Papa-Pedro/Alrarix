//
//  Cource.swift
//  NetworkLayer
//
//  Created by Tim Ferens on 21.12.2019.
//  Copyright © 2019 Tim Ferens. All rights reserved.
//

import Foundation
//тут говорим о структуре в которой нам передают информацию
struct Cource: Codable {
    let event: Event
}

struct Event: Codable {
    let title: String
    let dayes: [Day]
}

struct Day: Codable {
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let timeString: String
}
