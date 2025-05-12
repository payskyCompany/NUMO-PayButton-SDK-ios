//
//  NumberFormatter+Extensions.swift
//  PayButton
//
//  Created by PaySky106 on 02/10/2024.
//  Copyright © 2024 PaySky. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static func formatAmount(_ amount: Double, fractionDigits: Int = 0) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX") // consistent dot separator
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: amount)) ?? ""
    }
}

