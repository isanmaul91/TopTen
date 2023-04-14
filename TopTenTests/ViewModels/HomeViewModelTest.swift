//
//  HomeViewModelTest.swift
//  TopTenTests
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import XCTest
@testable import TopTen

class HomeViewModelTest: XCTestCase {
    var sut: HomeViewModel!
    var mockApiService: MockApiService!
    
    override func setUp() {
        super.setUp()
        setupData()
    }
    
    override func tearDown() {
        mockApiService = nil
        sut = nil
        
        super.tearDown()
    }
    
    func setupData() {
        mockApiService = MockApiService()
        sut = .init(apiService: mockApiService)
    }
    
    func testFetchPostListSuccess() {
        // given
        setupData()
        let mockPostData: PostModel = .init().mockData()
        let mockPostList: [PostModel] = [mockPostData]
        mockApiService.mockPostList = mockPostList
        // when
        sut.fetch()
        // then
        XCTAssertEqual(sut.getPostList().count, mockPostList.count)
    }
    
    func testFetchPostListError() {
        // given
        setupData()
        let mockPostData: PostModel = .init().mockData()
        let mockPostList: [PostModel] = [mockPostData]
        mockApiService.mockPostList = mockPostList
        mockApiService.status = .error
        // when
        sut.fetch()
        // then
        XCTAssertEqual(sut.requestState.value, .error)
    }
    
    func testFetchPhotoListSuccess() {
        // given
        setupData()
        let mockPhotoData: PhotoModel = .init().mockData()
        let mockPhotoList: [PhotoModel] = [mockPhotoData]
        mockApiService.mockPhotoList = mockPhotoList
        // when
        sut.fetch()
        // then
        XCTAssertEqual(sut.getPhotoList().count, mockPhotoList.count)
    }
    
    func testFetchPhotoListError() {
        // given
        setupData()
        let mockPhotoData: PhotoModel = .init().mockData()
        let mockPhotoList: [PhotoModel] = [mockPhotoData]
        mockApiService.mockPhotoList = mockPhotoList
        mockApiService.status = .error
        // when
        sut.fetch()
        // then
        XCTAssertEqual(sut.requestState.value, .error)
    }
}
