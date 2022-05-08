//
//  Int+Extension.swift
//  Alias
//
//  Created by Aleksandr on 02.05.2022.
//

import Foundation

extension Int {
    var hours: Int {
        self / 3600
    }
    
    var minutes: Int {
        (self % 3600) / 60
    }
    
    var seconds: Int {
        (self % 3600) % 60
    }
}
