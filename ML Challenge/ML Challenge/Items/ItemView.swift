//
//  ItemView.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

import UIKit

class ItemView: UIViewController, ItemViewProtocol {
    let notAllowedCharacters = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.";
    var presenter: ItemPresenterProtocol?
    let vwConteiner: UIView = {
        let vwConteiner = UIView()
        vwConteiner.translatesAutoresizingMaskIntoConstraints = false
        vwConteiner.backgroundColor = .yellow
        return vwConteiner
    }()
    
    let tFSchear: UITextField = {
        let tFSchear = UITextField()
        tFSchear.backgroundColor = .white
        tFSchear.placeholder = "Ingresa lo que necesitas"
        tFSchear.borderStyle = .roundedRect
        tFSchear.translatesAutoresizingMaskIntoConstraints = false
        return tFSchear
    }()
    
    let btnFind: UIButton = {
        let btnFind = UIButton()
        btnFind.backgroundColor = .gray
        btnFind.isUserInteractionEnabled = false
        btnFind.clipsToBounds = true
        btnFind.layer.cornerRadius = 10
        btnFind.setTitle(" Buscar ", for: .normal)
        btnFind.translatesAutoresizingMaskIntoConstraints = false
        btnFind.addTarget(self, action:  #selector(findItems), for: .touchUpInside)
        return btnFind
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tFSchear.delegate  = self
        setUpConstrains()
        vwConteiner.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(dissmiss)))
    
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.vwConteiner.frame.origin.y == 0 {
                self.vwConteiner.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.vwConteiner.frame.origin.y != 0 {
            self.vwConteiner.frame.origin.y = 0
        }
    }
    func setUpConstrains() {
        view.addSubview(vwConteiner)
        [tFSchear, btnFind].forEach(vwConteiner.addSubview)
        
        NSLayoutConstraint.activate([
            vwConteiner.topAnchor.constraint(equalTo: view.topAnchor),
            vwConteiner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vwConteiner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vwConteiner.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tFSchear.topAnchor.constraint(equalTo: vwConteiner.topAnchor, constant: 10),
            tFSchear.centerXAnchor.constraint(equalTo: vwConteiner.centerXAnchor),
            tFSchear.heightAnchor.constraint(equalToConstant: 50),
            tFSchear.widthAnchor.constraint(equalToConstant: 300),
            
            btnFind.topAnchor.constraint(equalTo: tFSchear.bottomAnchor, constant: 10),
            btnFind.centerXAnchor.constraint(equalTo: vwConteiner.centerXAnchor)
        ])
    }
  @objc func findItems() {
      presenter?.findItem(strWord: tFSchear.text ?? "")
      let vwList = ItemListRouter.createItemList()
      navigationController?.pushViewController(vwList, animated: true)
    }
   @objc func dissmiss() {
       self.view.endEditing(true)
    }
}
extension ItemView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 0 {
            btnFind.backgroundColor = .gray
            btnFind.isUserInteractionEnabled = false
        } else {
            btnFind.backgroundColor = .blue
            btnFind.isUserInteractionEnabled = true
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 50
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        return newString.count <= maxLength
    }
}
