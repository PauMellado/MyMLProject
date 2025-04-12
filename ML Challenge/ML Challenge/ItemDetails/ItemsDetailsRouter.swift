//
//  ItemsDetailsRouter.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//

import UIKit
class ItemsDetailsRouter: ItemDetailsRouterProtocol {
    static func createItemDetails(produt: ResultML) -> UIViewController {
        let view: ItemDetailsViewProtocol = ItemsDetailsView()
        let presenter: ItemDetailsPresenterProtocol & ItemDetailsInteractorOutputProtocol = ItemsDetailsPresenter()
        let interactor: ItemDetailsInteractorInputProtocol = ItemsDetailsInteractor()
        let remoteDataManager: ItemDetailsDataManagerInputProtocol = ItemDetailsRemoteDataManager()
        let router: ItemDetailsRouterProtocol = ItemsDetailsRouter()
        view.presenter = presenter
        view.produt = produt
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
