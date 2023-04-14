//
//  Constants.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

struct Api {
    static let BASE_URL = "https://jsonplaceholder.typicode.com"
}

enum UserDefaultsKey {
    static let fullname = "fullname_key"
}

enum Space: CGFloat {
    case x0 = 0
    case x1 = 1
    case x2 = 2
    case x4 = 4
    case x8 = 8
    case x12 = 12
    case x16 = 16
    case x20 = 20
    case x24 = 24
    case x28 = 28
    case x32 = 32
    case x36 = 36
    case x40 = 40
    case x60 = 60
    case x100 = 100
}

enum RequestState {
    case ready
    case loading
    case success
    case error
}

enum RequestError: Error {
    case cannotFetch
}

class L {
    static let morning: String = "Good Morning"
    static let afternoon: String = "Good Afternoon"
    static let evening: String = "Good Evening"
    static let your_name: String = "Please input your name"
    static let name_placeholder: String = "update your name"
    static let save_text: String = "Save"
    static let top_ten_posts: String = "Top 10 Posts"
    static let top_ten_photos: String = "Top 10 Photos"
}
