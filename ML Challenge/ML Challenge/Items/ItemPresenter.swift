//
//  ItemPresenter.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

class ItemPresenter: ItemPresenterProtocol, ItemInteractorOutputProtocol {

    
    var view: ItemViewProtocol?
    var interactor: ItemInteractorInputProtocol?
    var router: ItemRouterProtocol?
    
    func findItem(strWord: String) {
        interactor?.findItem(strWord: strWord)
    }
    func goToList(result: ReponseMLChallenge ) {
        view?.goToList(result: result)
    }
}
