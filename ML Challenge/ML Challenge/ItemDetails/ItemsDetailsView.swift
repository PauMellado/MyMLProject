//
//  ItemsDetailsView.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 30/03/25.
//
import UIKit
class ItemsDetailsView: UIViewController, ItemDetailsViewProtocol {
    var presenter: ItemDetailsPresenterProtocol?
    let svContentView: UIScrollView = {
        let svContentView  = UIScrollView()
        svContentView.backgroundColor =  .yellow
        svContentView.showsVerticalScrollIndicator = false
        svContentView.showsHorizontalScrollIndicator = false
        svContentView.translatesAutoresizingMaskIntoConstraints = false
        return svContentView
    }()
    let imgPrinciaplImage: UIImageView = {
        let imgPrinciaplImage = UIImageView()
        imgPrinciaplImage.image = UIImage(named: "Item")
        imgPrinciaplImage.backgroundColor = .clear
        imgPrinciaplImage.translatesAutoresizingMaskIntoConstraints = false
        imgPrinciaplImage.contentMode = .scaleAspectFit
        return imgPrinciaplImage
    }()
    let stkInfoItem: UIStackView = {
        let stkInfoItem = UIStackView()
        stkInfoItem.axis = .vertical
        stkInfoItem.layer.cornerRadius = 10
        stkInfoItem.translatesAutoresizingMaskIntoConstraints = false
        return stkInfoItem
    }()
    let lblNameItem: UILabel = {
        let lblNameItem = UILabel()
        lblNameItem.font = .systemFont(ofSize: 20)
        lblNameItem.numberOfLines = 2
        lblNameItem.text = "Producto: Motorola G6 Plus 64 Gb Nimbus"
        lblNameItem.translatesAutoresizingMaskIntoConstraints = false
        return lblNameItem
    }()
    let lblModelItem: UILabel = {
        let lblModelItem = UILabel()
        lblModelItem.font = .systemFont(ofSize: 18)
        lblModelItem.numberOfLines = 2
        lblModelItem.translatesAutoresizingMaskIntoConstraints = false
        lblModelItem.text = "Modelo: 6936760"
        return lblModelItem
    }()
    let lblAvilableItem: UILabel = {
        let lblAvilableItem = UILabel()
        lblAvilableItem.font = .systemFont(ofSize: 18)
        lblAvilableItem.numberOfLines = 2
        lblAvilableItem.text = "Disponible"
        lblAvilableItem.translatesAutoresizingMaskIntoConstraints = false
        return lblAvilableItem
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstrains()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        svContentView.delegate = self
        svContentView.contentSize = CGSize(width: self.view.frame.size.width, height: stkInfoItem.frame.width + 100)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.svContentView.resizeScrollViewContentSize()
            self.svContentView.layoutIfNeeded()
        }
    }

    func setUpConstrains() {
        view.addSubview(svContentView)
        [imgPrinciaplImage, stkInfoItem].forEach(svContentView.addSubview)
        NSLayoutConstraint.activate([
            svContentView.topAnchor.constraint(equalTo: view.topAnchor),
            svContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            svContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            svContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imgPrinciaplImage.topAnchor.constraint(equalTo: svContentView.topAnchor, constant: 20),
            imgPrinciaplImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imgPrinciaplImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imgPrinciaplImage.heightAnchor.constraint(equalToConstant: 300),
            
            stkInfoItem.topAnchor.constraint(equalTo: imgPrinciaplImage.bottomAnchor, constant: 20),
            stkInfoItem.leadingAnchor.constraint(equalTo: svContentView.leadingAnchor, constant: 10),
            stkInfoItem.trailingAnchor.constraint(equalTo: svContentView.trailingAnchor, constant: -10),
            stkInfoItem.bottomAnchor.constraint(equalTo: svContentView.bottomAnchor),
            
        ])
        stkInfoItem.addArrangedSubview(lblNameItem)
        stkInfoItem.addArrangedSubview(lblModelItem)
        stkInfoItem.addArrangedSubview(lblAvilableItem)
    }
}
extension UIScrollView {
    public func resizeScrollViewContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        contentRect.size.height += 20
        self.contentSize = contentRect.size
    }
}
extension ItemsDetailsView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}
