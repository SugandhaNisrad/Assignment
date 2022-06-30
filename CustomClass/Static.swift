//
//  Static.swift
//  Assignment
//
//  Created by Admin on 22/06/22.
//

import Foundation
class Static{
    struct Commonvar{
        static var url = "https://qapptemporary.s3.ap-south-1.amazonaws.com/test/gainer_loser.json"
        static var symbol = [String]()
        static var pricechange = [String]()
        static var price = [String]()

    }
    struct commonfunction{
       static func convertStringToDictionary(text: String) -> [String:AnyObject]? {
            if let data = text.data(using: .utf8) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    return json
                } catch {
                    print(error.localizedDescription)
                }
            }
            return nil
        }
    }
    struct collectionviewVariable{
        static var identifier = "cell"
        static var inset = 10.0
        static var minimumLineSpacing = 2.0
        static var minimumInteritemSpacing = 2.0
        static var cellsPerRow = 3
        static var cellcount = 0

    }
    struct colorchange{
        static var redcolor = 1
        static var greencolor = 1
    }
}
