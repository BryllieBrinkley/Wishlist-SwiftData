//
//  WishModel.swift
//  Wishlist
//
//  Created by Jibryll Brinkley on 3/30/25.
//

import Foundation
import SwiftData

@Model // converts a swift class into a stored model managed by SwiftData
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }

}
