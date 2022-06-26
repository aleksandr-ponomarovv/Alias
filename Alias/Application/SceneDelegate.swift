//
//  SceneDelegate.swift
//  Alias
//
//  Created by Aleksandr on 22.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var appCoordinator: BaseCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        appCoordinator = AppCoordinator()
        appCoordinator?.start()
    }
}
