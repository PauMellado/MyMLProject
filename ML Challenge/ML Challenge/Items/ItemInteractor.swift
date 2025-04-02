//
//  ItemInteractor.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

class ItemInteractor:  ItemInteractorInputProtocol {

    
    var presenter: ItemInteractorOutputProtocol?
    var remoteDatamanager: ItemDataManagerInputProtocol?
    func findItem(strWord: String) {
        guard let data = JsonHelper().getJsonFile(fileName: strWord) else { return }
        print("Holis")
        print(data)
        
    }
}
