//
//  StexWallet.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/10/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public class StexWallet: Codable {
    
    public var id: Int?
    public var currencyId: Int
    public var isDelisted: Bool
    public var isDisabled: Bool
    public var isDisabledDeposit: Bool
    public var currencyCode: String
    public var currencyName: String
    
    /// Available balance in given currency
    public var balance: Double
    
    /// Amount of coins frozen in orders
    public var frozenBalance: Double
    
    /// Bonus (e.g. for affiliate program) balance
    public var bonusBalance: Double
    
    public var totalBalance: Double
    
    public var protocolSettings: [StexWalletProtocol]?
    
    public var rates: [String: String]
    
    public var withdrawalAdditionalFieldNameWallet: String?
      
    public var isDisabledWithdrawals: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case currencyId = "currency_id"
        case isDelisted = "delisted"
        case isDisabled = "disabled"
        case isDisabledDeposit = "disable_deposits"
        case currencyCode = "currency_code"
        case currencyName = "currency_name"
        case balance
        case frozenBalance = "frozen_balance"
        case bonusBalance = "bonus_balance"
        case totalBalance = "total_balance"
        case protocolSettings = "protocol_specific_settings"
        case rates
        case withdrawalAdditionalFieldNameWallet = "withdrawal_additional_field_name"
        case isDisabledWithdrawals = "disable_withdrawals"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(Int.self, forKey: .id)
        currencyId = try container.decode(Int.self, forKey: .currencyId)
        isDelisted = try container.decode(Bool.self, forKey: .isDelisted)
        isDisabled = try container.decode(Bool.self, forKey: .isDisabled)
        isDisabledDeposit = try container.decode(Bool.self, forKey: .isDisabledDeposit)
        currencyCode = try container.decode(String.self, forKey: .currencyCode)
        currencyName = try container.decode(String.self, forKey: .currencyName)
        protocolSettings = try? container.decode([StexWalletProtocol].self, forKey: .protocolSettings)
        rates = try container.decode([String: String].self, forKey: .rates)
        
        balance = try container.decodeStringToDouble(.balance) ?? 0
        frozenBalance = try container.decodeStringToDouble(.frozenBalance) ?? 0
        bonusBalance = try container.decodeStringToDouble(.bonusBalance) ?? 0
        totalBalance = try container.decodeStringToDouble(.totalBalance) ?? 0
        
        withdrawalAdditionalFieldNameWallet = try? container.decode(String.self, forKey: .withdrawalAdditionalFieldNameWallet)
                     
        isDisabledWithdrawals = try? container.decode(Bool.self, forKey: .isDisabledWithdrawals)
    }
}
