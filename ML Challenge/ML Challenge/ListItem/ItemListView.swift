//
//  ItemListView.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//
import UIKit

class ItemListView: UIViewController, ItemListViewProtocol {
    var presenter: ItemListPresenterProtocol?
    let vwItemList: UIView = {
        let vwItemList = UIView()
        vwItemList.backgroundColor = .white
        vwItemList.translatesAutoresizingMaskIntoConstraints = false
        return vwItemList
    }()
    let lblNameList: UILabel = {
        let lblNameList = UILabel()
        lblNameList.font = .systemFont(ofSize: 24)
        lblNameList.text = "Lista Produstos"
        lblNameList.translatesAutoresizingMaskIntoConstraints = false
        return lblNameList
    }()
    let lblSNList: UILabel = {
        let lblSNList = UILabel()
        lblSNList.font = .systemFont(ofSize: 12)
        lblSNList.text = "Resultados de: "
        lblSNList.translatesAutoresizingMaskIntoConstraints = false
        return lblSNList
    }()
    let tblListItem: UITableView = {
        let tblListItem = UITableView()
        tblListItem.separatorColor = .clear
        tblListItem.backgroundColor = .yellow
        tblListItem.clipsToBounds = true
        tblListItem.layer.cornerRadius = 10
        tblListItem.register(ItemListViewCell.self, forCellReuseIdentifier: "ItemListViewCell")
        tblListItem.showsVerticalScrollIndicator = false
        tblListItem.showsHorizontalScrollIndicator = false
        
        tblListItem.translatesAutoresizingMaskIntoConstraints = false
        return tblListItem
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstrains()
        UINavigationBar.appearance().backgroundColor = UIColor.yellow
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
       

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tblListItem.delegate = self
        tblListItem.dataSource = self
    }
    func setUpConstrains() {
        [vwItemList].forEach(view.addSubview)
        [lblNameList, lblSNList, tblListItem].forEach(vwItemList.addSubview)
        NSLayoutConstraint.activate([
            vwItemList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vwItemList.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            vwItemList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vwItemList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lblNameList.leadingAnchor.constraint(equalTo: vwItemList.leadingAnchor, constant: 16),
            lblNameList.topAnchor.constraint(equalTo: vwItemList.topAnchor, constant: 16),
            lblSNList.leadingAnchor.constraint(equalTo: vwItemList.leadingAnchor, constant: 16),
            lblSNList.topAnchor.constraint(equalTo: lblNameList.bottomAnchor, constant: 5),
            tblListItem.leadingAnchor.constraint(equalTo: vwItemList.leadingAnchor, constant: 16),
            tblListItem.trailingAnchor.constraint(equalTo: vwItemList.trailingAnchor, constant: -16),
            tblListItem.topAnchor.constraint(equalTo: lblSNList.bottomAnchor, constant: 20),
            tblListItem.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
            
        ])
    }
}
extension ItemListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListViewCell",
                                                        for: indexPath) as? ItemListViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setUpCell(strName: "Producto \(indexPath.row)", strDirection: "Gratis")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vwDetails = ItemsDetailsRouter.createItemDetails()
        navigationController?.pushViewController(vwDetails, animated: true)
        
    }
}
