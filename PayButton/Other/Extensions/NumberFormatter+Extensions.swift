//
//  NumberFormatter+Extensions.swift
//  PayButton
//
//  Created by PaySky106 on 02/10/2024.
//  Copyright © 2024 PaySky. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static func formatAmount(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: amount)) ?? ""
    }
}
