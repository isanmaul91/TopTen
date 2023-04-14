//
//  APIService.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchPostList(completion: @escaping (_ resp: [PostModel]?, _ error: Error?) -> Void)
    func fetchPhotoList(completion: @escaping (_ resp: [PhotoModel]?, _ error: Error?) -> Void)
}

class APIService: APIServiceProtocol {
    
    func fetchPostList(completion: @escaping ([PostModel]?, Error?) -> Void) {
        let urlString: String = "\(Api.BASE_URL)/posts"
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, resp, err in
            guard let data = data else {
                completion(nil, err)
                return
            }
            let decoder = JSONDecoder()
            do {
                let listModel: [PostModel] = try decoder.decode([PostModel].self, from: data)
                completion(listModel, nil)
            } catch {
                completion(nil, err)
            }
        }

        task.resume()
    }
    
    func fetchPhotoList(completion: @escaping ([PhotoModel]?, Error?) -> Void) {
        let urlString: String = "\(Api.BASE_URL)/photos"
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, resp, err in
            guard let data = data else {
                completion(nil, err)
                return
            }
            let decoder = JSONDecoder()
            do {
                let listModel: [PhotoModel] = try decoder.decode([PhotoModel].self, from: data)
                completion(listModel, nil)
            } catch {
                completion(nil, err)
            }
        }

        task.resume()
    }
}
