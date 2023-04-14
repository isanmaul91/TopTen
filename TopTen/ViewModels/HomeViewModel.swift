//
//  HomeViewModel.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var requestState: Observable<RequestState> { get }
    var needUpdateName: Observable<Bool> { get }
    func getTitle() -> String
    func setName(_ name: String)
    func getPostList() -> [PostModel]
    func getPhotoList() -> [PhotoModel]
    func fetch()
}

class HomeViewModel: HomeViewModelProtocol {
    var requestState: Observable<RequestState> = Observable(value: .ready)
    var needUpdateName: Observable<Bool> = Observable(value: false)
    private var apiService: APIServiceProtocol
    private var postList: [PostModel] = []
    private var photoList: [PhotoModel] = []
    private let limit: Int = 10
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func getTitle() -> String {
        var title = ""
        var name = L.name_placeholder
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 5..<12 : title = L.morning
        case 12..<18 : title = L.afternoon
        default: title = L.evening
        }
        
        if let fullname: String = UserDefaults.standard.string(
            forKey: UserDefaultsKey.fullname), !fullname.isEmpty {
            name = fullname
        } else {
            needUpdateName.value = true
        }
        
        return title + ",\n" + name
    }
    
    func setName(_ name: String) {
        UserDefaults.standard.set(
            name,
            forKey: UserDefaultsKey.fullname
        )
    }
    
    func getPostList() -> [PostModel] {
        return postList
    }
    
    func getPhotoList() -> [PhotoModel] {
        return photoList
    }
    
    func fetch() {
        fetchPostList()
        fetchPhotoList()
    }
    
    private func fetchPostList() {
        apiService.fetchPostList { [weak self] resp, err in
            guard let ws = self else { return }
            if let resp = resp {
                ws.mappingPostData(resp)
                ws.requestState.value = .success
            } else {
                ws.requestState.value = .error
            }
        }
    }
    
    private func mappingPostData(_ resp: [PostModel]) {
        postList.removeAll()
        for (index, post) in resp.enumerated() {
            guard index < limit else { break }
            postList.append(post)
        }
    }
    
    private func fetchPhotoList() {
        apiService.fetchPhotoList { [weak self] resp, err in
            guard let ws = self else { return }
            if let resp = resp {
                ws.mappingPhotoData(resp)
                ws.requestState.value = .success
            } else {
                ws.requestState.value = .error
            }
        }
    }
    
    private func mappingPhotoData(_ resp: [PhotoModel]) {
        photoList.removeAll()
        for (index, post) in resp.enumerated() {
            guard index < limit else { break }
            photoList.append(post)
        }
    }
}
