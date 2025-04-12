//
//  ItemDetailsProtocols.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//

import Foundation
import UIKit

protocol ItemDetailsViewProtocol: AnyObject {
    var presenter: ItemDetailsPresenterProtocol? { get set }
    var produt: ResultML? { get set }
}

protocol ItemDetailsInteractorInputProtocol: AnyObject {
    var presenter: ItemDetailsInteractorOutputProtocol? { get set }
    var remoteDatamanager: ItemDetailsDataManagerInputProtocol? { get set }
}

protocol ItemDetailsPresenterProtocol: AnyObject {
    var view: ItemDetailsViewProtocol? { get set }
    var interactor: ItemDetailsInteractorInputProtocol? { get set }
    var router: ItemDetailsRouterProtocol? { get set }
}

protocol ItemDetailsRouterProtocol: AnyObject {
    static func createItemDetails(produt: ResultML) -> UIViewController
}

protocol ItemDetailsDataManagerInputProtocol: AnyObject {

}
protocol ItemDetailsInteractorOutputProtocol: AnyObject {
    
}

