//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Rafael Melo on 23/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageBg: UIImageView!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var quoteTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    
    let quotesManager = QuoteManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
        formatView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView() {
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        quote.textColor = config.colorScheme == 0 ? .black : .white
        author.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
    }
    
    func prepareQuote() {
        timer?.invalidate()
        
        if config.autoRefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let randomQuote = quotesManager.getRandomQuote()
        quote.text = randomQuote.quote
        author.text = randomQuote.author
        image.image = UIImage(named: randomQuote.image)
        imageBg.image = image.image
        
        quote.alpha = 0.0
        author.alpha = 0.0
        image.alpha = 0.0
        imageBg.alpha = 0.0
        quoteTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.quote.alpha = 1.0
            self.author.alpha = 1.0
            self.image.alpha = 1.0
            self.imageBg.alpha = 0.25
            self.quoteTop.constant = 10
            self.view.layoutIfNeeded()
        }
     }

}
