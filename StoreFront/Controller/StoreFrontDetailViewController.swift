//
//  StoreFrontDetailViewController.swift
//  StoreFront
//
//  Created by Jamario Davis on 11/6/21.
//

import UIKit

class StoreFrontDetailViewController: UIViewController {
    
    @IBOutlet weak var detailProductImage: UIImageView!
    @IBOutlet weak var detailProductTitleLabel: UILabel!
    @IBOutlet weak var detailProductPriceLabel: UILabel!
    @IBOutlet weak var detailProductDescriptionLabel: UILabel!
    
    var store: StoreFront?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //Currency formatter fail to format numbers due to API format
        let productPrice = store?.price
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.locale = Locale.current
        
        let priceString = currencyFormatter.string(from: NSNumber(value: productPrice!))
        
        detailProductTitleLabel.text = store?.title
        detailProductPriceLabel.text = "$\(priceString ?? "No listed price")"
        detailProductDescriptionLabel.text = store?.description
        if let url = URL(string: store!.image) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async { [self] in
                     
                        detailProductImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}
