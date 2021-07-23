//
//  apiManager.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import Foundation

final class ApiManager {
    
    func fetch<T: Codable>(page: Int, completion: @escaping (T) -> Void, errorHandler: @escaping (URLError?) -> Void) {
        let path = "https://api.themoviedb.org/3/movie/popular?api_key=3952b33c810a5ad9a1889b306f34924b&page=\(page)"
        guard let url = URL(string: path) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error as? URLError {
                errorHandler(error)
            }
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object)
            } catch let error as NSError {
                print(error.userInfo)
            }
        }.resume()
    }
}

