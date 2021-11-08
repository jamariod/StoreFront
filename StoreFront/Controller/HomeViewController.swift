//
//  HomeViewController.swift
//  StoreFront
//
//  Created by Jamario Davis on 11/6/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Segue to StoreFrontViewController after 1.5 seconds
        DispatchQueue.main.asyncAfter(deadline:.now() + 1.5, execute: {
           self.performSegue(withIdentifier:"storeFront",sender: self)
        })
    }


}

