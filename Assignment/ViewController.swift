//
//  ViewController.swift
//  Assignment
//
//  Created by Admin on 21/06/22.
//

import UIKit
class ViewController: UIViewController {
    let searchcontroller = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchcontroller
        collectionview.delegate = self
        collectionview.dataSource = self
        Apiservice.getJson(urlString: Static.Commonvar.url, finish: finishPost)
    }
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    func finishPost (message: String) -> Void {
        let data = Static.commonfunction.convertStringToDictionary(text: message) ?? [:]
        if data.count != 0{
            Static.Commonvar.symbol.append(contentsOf: data["symbol"] as! [String])
            Static.Commonvar.pricechange.append(contentsOf: data["price_change"] as! [String])
            Static.Commonvar.price.append(contentsOf: data["price"] as! [String])
            
        }
        DispatchQueue.main.async { [self] in
            collectionview.reloadData()
        }
    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Static.collectionviewVariable.cellcount = Static.Commonvar.symbol.count
        return Static.Commonvar.symbol.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: Static.collectionviewVariable.identifier, for: indexPath) as! DataCollectionViewCell
        cell.Symbol_lbl.text = Static.Commonvar.symbol[indexPath.row]
        cell.pricechange_Lbl.text = Static.Commonvar.pricechange[indexPath.row]
        let price_chnage_String = Static.Commonvar.pricechange[indexPath.row]
        cell.price_Lbl.text = Static.Commonvar.price[indexPath.row]
        let color = cell.changebackgroundcolor(indexpath: indexPath.row, price_change: price_chnage_String)
        cell.contentView.backgroundColor = color
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Static.collectionviewVariable.inset, left: Static.collectionviewVariable.inset, bottom: Static.collectionviewVariable.inset, right: Static.collectionviewVariable.inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Static.collectionviewVariable.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Static.collectionviewVariable.minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let marginsAndInsets = Static.collectionviewVariable.inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + Static.collectionviewVariable.minimumInteritemSpacing * CGFloat(Static.collectionviewVariable.cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(Static.collectionviewVariable.cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    
}

