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
    
    let quotesManager = QuoteManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true, block: { (timer) in
            self.showRandomQuote()
        })
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
