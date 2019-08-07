//
//  Market.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class Market: Codable {
    
    /// CurrencyPairGroup code.
    ///
    /// Example: `ETH`
    public var code: String
    
    /// CurrencyPairGroup name.
    ///
    /// Example: `Etherium`
    public var name: String
}
