//
//  ItemProtocols.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

import Foundation
import UIKit

protocol ItemViewProtocol: AnyObject {
    var presenter: ItemPresenterProtocol? { get set }

}

protocol ItemInteractorInputProtocol: AnyObject {
    var presenter: ItemInteractorOutputProtocol? { get set }
    var remoteDatamanager: ItemDataManagerInputProtocol? { get set }
    func findItem(strWord: String)

}

protocol ItemPresenterProtocol: AnyObject {
    var view: ItemViewProtocol? { get set }
    var interactor: ItemInteractorInputProtocol? { get set }
    var router: ItemRouterProtocol? { get set }
    func findItem(strWord: String)
    
}

protocol ItemRouterProtocol: AnyObject {
    static func createFindItem() -> UIViewController
}

protocol ItemDataManagerInputProtocol: AnyObject {
    func getItems(strFind: String, completion: @escaping (Result<ReponseMLChallenge, Error>) -> Void)
}
protocol ItemInteractorOutputProtocol: AnyObject {
    
}
