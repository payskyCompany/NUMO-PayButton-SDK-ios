//
//  CurrencyHelper.swift
//  PayButton
//
//  Created by PaySky106 on 02/10/2024.
//  Copyright © 2024 PaySky. All rights reserved.
//

import Foundation

class CurrencyHelper: NSObject, XMLParserDelegate {
    
    var currentElement: String = ""
    var currentCurrencyItem: CurrencyCode?
    var foundCityName: String = ""
    var foundCurrencyName: String = ""
    var foundCurrencyShortName: String = ""
    var foundCurrencyNumber: String = ""
    var foundCurrencyUnit: String = ""
    var desiredCurrencyCode: String = ""
    
    func getCurrencyCode(currencyCode: String) -> CurrencyCode? {
        self.desiredCurrencyCode = currencyCode
        
        if let parser = parseXML() {
            parser.delegate = self
            if parser.parse() {
                return currentCurrencyItem
            }
        }
        return nil
    }
    
    private func parseXML() -> XMLParser? {
        guard let path = Bundle.main.path(forResource: "currency_iso", ofType: "xml"),
              let xmlData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }
        
        return XMLParser(data: xmlData)
    }
    
    // MARK: - XMLParser Delegate Methods
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if elementName == "CcyNtry" {
            currentCurrencyItem = CurrencyCode()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !trimmedString.isEmpty {
            switch currentElement {
            case "CtryNm":
                foundCityName += trimmedString
            case "CcyNm":
                foundCurrencyName += trimmedString
            case "Ccy":
                foundCurrencyShortName += trimmedString
            case "CcyNbr":
                foundCurrencyNumber += trimmedString
            case "CcyMnrUnts":
                foundCurrencyUnit += trimmedString
            default:
                break
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "CcyNtry" {
            if let currencyItem = currentCurrencyItem,
               foundCurrencyNumber == desiredCurrencyCode {
                currencyItem.cityName = foundCityName
                currencyItem.currencyName = foundCurrencyName
                currencyItem.currencyShortName = foundCurrencyShortName
                currencyItem.currencyNumber = foundCurrencyNumber
                currencyItem.currencyUnit = foundCurrencyUnit
                currentCurrencyItem = currencyItem
                
                parser.delegate = nil
            }
            
            foundCityName = ""
            foundCurrencyName = ""
            foundCurrencyShortName = ""
            foundCurrencyNumber = ""
            foundCurrencyUnit = ""
        }
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Error occurred while parsing: \(parseError.localizedDescription)")
    }
}

class CurrencyCode {
    var cityName: String = ""
    var currencyName: String = ""
    var currencyShortName: String = ""
    var currencyNumber: String = ""
    var currencyUnit: String = ""
}
