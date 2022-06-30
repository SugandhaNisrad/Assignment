//
//  DataCollectionViewCell.swift
//  Assignment
//
//  Created by Admin on 21/06/22.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Symbol_lbl: UILabel!
    
    @IBOutlet weak var pricechange_Lbl: UILabel!
    
    @IBOutlet weak var price_Lbl: UILabel!
    var colorget:UIColor?

    func changebackgroundcolor(indexpath: Int , price_change: String) -> UIColor {
        let indexget = indexpath + 1
        let price_change_int = Float(price_change) ?? 0
        if indexget != 0{
            if price_change_int > 0{
                colorget = UIColor(red: 0.80, green: 0.36, blue: 0.36, alpha: 1.00)
                Static.colorchange.redcolor =  Static.colorchange.redcolor + 1
                if Static.colorchange.redcolor > 5{
                    Static.colorchange.redcolor = 1
                }
            }else{
                colorget = UIColor(red: 0.13, green: 0.55, blue: 0.13, alpha: 1.00)
                Static.colorchange.greencolor =  Static.colorchange.greencolor + 1

                if Static.colorchange.greencolor > 5{
                    Static.colorchange.greencolor = 1
                }
            }
        }
        return colorget!
    }
    
}
