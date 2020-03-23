//
//  Quote.swift
//  Pensamentos
//
//  Created by Rafael Melo on 23/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "❝" + quote + "❞"
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
}
