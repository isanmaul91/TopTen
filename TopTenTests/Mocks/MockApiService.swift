//
//  MockApiService.swift
//  TopTenTests
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import Foundation
@testable import TopTen

class MockApiService: APIServiceProtocol {
    
    
    enum Status {
        case success
        case error
    }
    
    var mockPostList: [PostModel] = .init()
    var mockPhotoList: [PhotoModel] = .init()
    var mockErrorResponse: Error = RequestError.cannotFetch
    var status: Status = .success
    
    func fetchPostList(completion: @escaping ([PostModel]?, Error?) -> Void) {
        switch status {
        case .success:
            completion(mockPostList, nil)
        case .error:
            completion(nil, mockErrorResponse)
        }
    }
    
    func fetchPhotoList(completion: @escaping ([PhotoModel]?, Error?) -> Void) {
        switch status {
        case .success:
            completion(mockPhotoList, nil)
        case .error:
            completion(nil, mockErrorResponse)
        }
    }
}
