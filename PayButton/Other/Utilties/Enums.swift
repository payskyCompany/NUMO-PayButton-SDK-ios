//
//  Enums.swift
//  PayButton
//
//  Created by Nada Kamel on 18/06/2023.
//  Copyright © 2023 PaySky. All rights reserved.
//

import Foundation

enum Environment: CustomStringConvertible {
    case Production
    case Testing
    
    var description: String {
        switch self {
        case .Production: return "https://omni-uat.gimpay.org/"
        case .Testing: return "https://omni-uat.gimpay.org/"
        }
    }
}

enum CountryCodes {
    case egypt
    case uae
    case qatar
    
    func getCode() -> Int {
        switch self {
        case .egypt:
            return 818
        case .uae:
            return 784
        case .qatar:
            return 634
        }
    }
}
