//
//  ViewController.swift
//  Bottlecapps
//
//  Created by Ivan Dasigan on 12/30/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let beer = Router<BeerAPI>()
        beer.request(.getAllBeers) { data, response, error in
            if error != nil {
                return
            }
            print(data)
        }
        
    }
}

