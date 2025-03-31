//
//  WishModel.swift
//  Wishlist
//
//  Created by Jibryll Brinkley on 3/30/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }

}
