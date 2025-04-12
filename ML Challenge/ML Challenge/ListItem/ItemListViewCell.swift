//
//  ItemListViewCell.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//

import UIKit
class ItemListViewCell: UITableViewCell {
    var result: ReponseMLChallenge?
    let vwItem: UIView = {
        let vwItem = UIView()
        vwItem.clipsToBounds = true
        vwItem.layer.cornerRadius = 10
        vwItem.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        vwItem.translatesAutoresizingMaskIntoConstraints = false
        return vwItem
    }()
    let imgItem: UIImageView = {
        let imgItem = UIImageView()
        imgItem.image = UIImage(named: "ML")
        imgItem.clipsToBounds = true
        imgItem.layer.cornerRadius = 10
        imgItem.translatesAutoresizingMaskIntoConstraints = false
        return imgItem
    }()
    let lblNameItem: UILabel = {
        let lblNameItem = UILabel()
        lblNameItem.font = .systemFont(ofSize: 14)
        lblNameItem.textColor = .black
        lblNameItem.translatesAutoresizingMaskIntoConstraints = false
        return lblNameItem
    }()
    let lblEnvioItem: UILabel = {
        let lblEnvioItem = UILabel()
        lblEnvioItem.font = .systemFont(ofSize: 12)
        lblEnvioItem.textColor = .green
        lblEnvioItem.translatesAutoresizingMaskIntoConstraints = false
        return lblEnvioItem
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        [vwItem].forEach(self.addSubview)
        [imgItem, lblNameItem, lblEnvioItem].forEach(vwItem.addSubview)
        NSLayoutConstraint.activate([
            vwItem.heightAnchor.constraint(equalToConstant: 65),
            vwItem.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            vwItem.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            vwItem.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            vwItem.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imgItem.leadingAnchor.constraint(equalTo: vwItem.leadingAnchor, constant: 20),
            imgItem.centerYAnchor.constraint(equalTo: vwItem.centerYAnchor),
            imgItem.heightAnchor.constraint(equalToConstant: 30),
            imgItem.widthAnchor.constraint(equalToConstant: 30),
            lblNameItem.leadingAnchor.constraint(equalTo: imgItem.trailingAnchor, constant: 16),
            lblNameItem.trailingAnchor.constraint(equalTo: vwItem.trailingAnchor, constant: -20),
            lblNameItem.topAnchor.constraint(equalTo: vwItem.topAnchor, constant: 15),
            lblEnvioItem.leadingAnchor.constraint(equalTo: imgItem.trailingAnchor, constant: 16),
            lblEnvioItem.trailingAnchor.constraint(equalTo: vwItem.trailingAnchor, constant: -20),
            lblEnvioItem.topAnchor.constraint(equalTo: lblNameItem.bottomAnchor)
        ])
    }
    func setUpCell(strName: String, strDirection: String) {
        lblNameItem.text = strName
        lblEnvioItem.text = strDirection
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
