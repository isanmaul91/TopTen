//
//  PostModel.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

struct PostModel: Codable, Equatable {
    var title: String = ""
    var body: String = ""
    
    init() {}
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        body = try values.decodeIfPresent(String.self, forKey: .body) ?? ""
    }
    
#if DEBUG
    @discardableResult
    func mockData() -> Self {
        var mock = self
        mock.title = "lorem ipsum"
        mock.body = "lorem ipsum"
        return mock
    }
#endif
}
