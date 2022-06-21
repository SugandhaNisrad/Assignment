//
//  ViewController.swift
//  Assignment
//
//  Created by Admin on 21/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJson()
    }
   
    struct Example: Codable {
        let userID: String
        let ID: String
        let title: String
        let completed: String
    }


    func getJson() {
        let urlString = "https://qapptemporary.s3.ap-south-1.amazonaws.com/test/gainer_loser.json"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) {data, res, err in
                if let data = data {

                    let decoder = JSONDecoder()
                    if let json: Example = try? decoder.decode(Example.self, from: data) {
                        print("json:\(json)")
                    }else{
                        print("data isempty")
                    }
                }else{
                    print("wrong")
                }
            }.resume()
        }
    }

   
    


}

