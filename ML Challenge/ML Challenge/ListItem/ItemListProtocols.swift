//
//  ItemListProtocols.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//
import Foundation
import UIKit

protocol ItemListViewProtocol: AnyObject {
    var presenter: ItemListPresenterProtocol? { get set }

}

protocol ItemListInteractorInputProtocol: AnyObject {
    var presenter: ItemListInteractorOutputProtocol? { get set }
    var remoteDatamanager: ItemListDataManagerInputProtocol? { get set }

}

protocol ItemListPresenterProtocol: AnyObject {
    var view: ItemListViewProtocol? { get set }
    var interactor: ItemListInteractorInputProtocol? { get set }
    var router: ItemListRouterProtocol? { get set }
    
}

protocol ItemListRouterProtocol: AnyObject {
    static func createItemList() -> UIViewController
}

protocol ItemListDataManagerInputProtocol: AnyObject {
}
protocol ItemListInteractorOutputProtocol: AnyObject {
    
}

