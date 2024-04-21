//
//  FirestoreManager.swift
//  testapp
//
//  Created by Chidume Nnamdi on 26/11/2023.
//

import Foundation

class FirestoreDataManager {

    private let url = "http://127.0.0.1:5001/xchat-ca125/us-central1/"

    func makeFirestorePostRequest<T: Codable>(collectionName: String, data: T, completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = URL(string: "\(self.url)\(collectionName)") else {
            completion(.failure(NSError(domain: "YourAppDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        do {
            let jsonData = try JSONEncoder().encode(data)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error)
                    completion(.failure(error))
                } else if let data = data {
                    completion(.success(data))
                }
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }

    func addDocument<T: Codable>(collection: String, data: T, completion: @escaping (Error?) -> Void) {
        makeFirestorePostRequest(collectionName: collection, data: data) { result in
            switch result {
            case .success:
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func getDocuments<T: Codable>(collection: String, objectType: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        guard let url = URL(string: "\(self.url)\(collection)") else {
            completion(.failure(NSError(domain: "YourAppDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([T].self, from: data!)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}
