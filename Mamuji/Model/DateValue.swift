//
//  DateValue.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/05/02.
//

import SwiftUI

// Date Value Model
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
