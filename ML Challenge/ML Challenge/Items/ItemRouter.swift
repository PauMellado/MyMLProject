//
//  ItemRouter.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

import Foundation

import UIKit
class  ItemRouter: ItemRouterProtocol {
    static func createFindItem() -> UIViewController {
        let view: ItemViewProtocol = ItemView()
        let presenter: ItemPresenter & ItemInteractorOutputProtocol = ItemPresenter()
        let interactor: ItemInteractorInputProtocol = ItemInteractor()
        let remoteDataManager: ItemRemoteDataManager = ItemRemoteDataManager()
        let router: ItemRouterProtocol = ItemRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        guard let viewController = view as? UIViewController else {
            return UIViewController()
        }
        return viewController
    }
}
