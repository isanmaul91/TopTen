//
//  PhotoModel.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

struct PhotoModel: Codable, Equatable {
    var title: String = ""
    var thumbnailUrl: String = ""
    
    init() {}
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl) ?? ""
    }
    
#if DEBUG
    @discardableResult
    func mockData() -> Self {
        var mock = self
        mock.title = "lorem ipsum"
        mock.thumbnailUrl = "https://via.placeholder.com/150/92c952"
        return mock
    }
#endif
}
