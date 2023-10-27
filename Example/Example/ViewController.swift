//
//  ViewController.swift
//  Example
//
//  Created by Ahmed Fathy on 27/10/2023.
//

import UIKit
import MFNetworking

struct Endpoint: Requestable {
    var baseUrl: URL { URL(string: "https://jsonplaceholder.typicode.com/")! }
    var path: String { "users" }
    var httpMethod: HTTPMethods { .get }
    var task: HTTPRequestTask { .requestPlain }
    var headers: Headers? { nil }
}

struct User: Codable {
    let name: String
    let email: String
}

struct UserRequestMapper {
    
    static func map(_ data: Data, response: HTTPURLResponse) -> [User]? {
        do{
            let users = try data.decode(to: [User].self)
            return users
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}


class ViewController: UIViewController {
    
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
    }
    
    private func fetchUsers() {
        client.perform(requester: Endpoint()) { result in
            switch result {
            case .success(let (data,response)):
                let users = UserRequestMapper.map(data, response: response)
                print(users)
            case .failure(let error):
                // Handle response Error
                print(error.localizedDescription)
            }
        }
    }
    
}
