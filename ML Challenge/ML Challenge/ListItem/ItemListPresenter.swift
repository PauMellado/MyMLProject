//
//  ItemListPresenter.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//

class ItemListPresenter: ItemListPresenterProtocol, ItemListInteractorOutputProtocol {
    var view: ItemListViewProtocol?
    var interactor: ItemListInteractorInputProtocol?
    var router: ItemListRouterProtocol?
    
}
