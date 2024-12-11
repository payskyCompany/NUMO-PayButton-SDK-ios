//
//  AppConstants.swift
//  PayButton
//
//  Created by AMR on 7/3/18.
//  Copyright © 2018 Paysky. All rights reserved.
//

import Foundation

class AppConstants {
    static var selectedCountryCode = CountryCodes.egypt.getCode()

    static let radiusNumber = CGFloat(4)

    static let DOMAIN_URL: String = {
        MerchantDataManager.shared.isProduction ? Environment.Production.description : Environment.Testing.description
    }()

    static func generateRandomNumber(digits: Int) -> String {
        var number = String()
        for _ in 1 ... digits {
            number += "\(Int.random(in: 1 ... 9))"
        }
        return number
    }
}

public class PaymentParams {
    static var MERCHANT_ID = "merchant_id"
    static var TERMINAL_ID = "terminal_id"
    static var ORDER_ID = "order_id"
    static var AMOUNT = "amount"
    static var CURRENCY_CODE = "currency_code"
    static var MERCHANT_TOKEN = "merchant_token"
}

public class ApiURL {
    static var GenerateQR = "GenerateQR"
    static var CheckTxnStatus = "CheckTxnStatus"
    static var SendReceiptToEmail = "SendReceiptToEmail"
    static var RequestToPay = "RequestToPay"
    static var PayByCard = "PayByCard"
    static var CheckPaymentMethod = "CheckPaymentMethod"
}
