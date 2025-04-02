//
//  ItemListInteractor.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//
class ItemListInteractor: ItemListInteractorInputProtocol {
    var presenter: ItemListInteractorOutputProtocol?
    var remoteDatamanager: ItemListDataManagerInputProtocol?    
}
