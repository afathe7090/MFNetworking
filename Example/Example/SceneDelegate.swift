//
//  SceneDelegate.swift
//  Example
//
//  Created by Ahmed Fathy on 27/10/2023.
//

import UIKit
import MFNetworking

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        let client: HTTPClient = URLSessionHTTPClientProvider(session: session)
        let rootViewController = ViewController(client: client)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }

}

