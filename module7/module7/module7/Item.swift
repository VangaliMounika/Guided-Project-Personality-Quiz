//
//  Item.swift
//  module7
//
//  Created by Mounika Vanagli on 5/18/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
