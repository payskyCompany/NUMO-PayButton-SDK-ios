//
//  PaymentData.swift
//  tokenization
//
//  Created by AMR on 7/3/18.
//  Copyright © 2018 Paysky. All rights reserved.
//

import Foundation

class PaymentData: EVObject {
    var orderId = 0
    var merchantId = ""
    var staticQR = ""
    var Is3DS = true
    var amount = ""
    var terminalId = ""
    var KEY = ""
    var currencyCode = 0
    var merchant_name = ""
    var refnumber = ""
    var PaymentMethod = 0
}
