//
//  ItemListE.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//
import UIKit

class  ItemListRouter: ItemListRouterProtocol {
    static func createItemList(result: ReponseMLChallenge) -> UIViewController {
        let view: ItemListViewProtocol = ItemListView()
        let presenter: ItemListPresenter & ItemListInteractorOutputProtocol = ItemListPresenter()
        let interactor: ItemListInteractorInputProtocol = ItemListInteractor()
        let remoteDataManager: ItemListRemoteDataManager = ItemListRemoteDataManager()
        let router: ItemListRouterProtocol = ItemListRouter()
        view.presenter = presenter
        view.result = result
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
