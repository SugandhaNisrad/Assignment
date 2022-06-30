//
//  ApiService.swift
//  Assignment
//
//  Created by Admin on 22/06/22.
//

import Foundation
class Apiservice{
    static func getJson(urlString: String,finish: @escaping ((String)) -> Void) {
        let urlString = "https://qapptemporary.s3.ap-south-1.amazonaws.com/test/gainer_loser.json"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) {data, res, err in
                if let data = data {
                    do{
                        let dataString =  String(data: data, encoding: String.Encoding.utf8)
                        finish(dataString!)
                     }catch{
                        print("data isempty")
                    }
                }
            }.resume()
        }
    }
}
