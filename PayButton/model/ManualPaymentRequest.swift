//
//  ManualPaymentRequest.swift
//  PayButton
//
//  Created by AMR on 10/8/18.
//  Copyright © 2018 Paysky. All rights reserved.
//

import Foundation

public class ManualPaymentRequest: BaseResponse {
    var ThreeDSECI = ""
    var ThreeDSXID = ""
    var ThreeDSenrolled = ""
    var ThreeDSstatus = ""
    var VerToken = ""
    var VerType = ""
    var CurrencyCodeTrxn = MainScanViewController.paymentData.currencyCode
    var CardHolderName = ""
    var DateExpiration = ""
    var PAN = ""
    var AmountTrxn  = 0
    var IsWebRequest = true
    var ReturnURL = ApiURL.MAIN_API_LINK.replacingOccurrences(of: "/Cube/PayLink.svc/api/", with: "")
    var MerchantReference = MainScanViewController.paymentData.refnumber
    var SystemTraceNr = MainScanViewController.paymentData.refnumber
 
}
