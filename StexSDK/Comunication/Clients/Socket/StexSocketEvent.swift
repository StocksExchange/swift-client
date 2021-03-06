//
//  StexSocketEvent.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/6/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public enum StexSocketEvent {
    /// Ticker changes
    case rate
    
    /// New trades for the given currency pair
    case tradeCreated(Int)
    
    /// Given currency pair sell glass totals changes
    case sellGlassTotalChanged(Int)
    
    /// Given currency pair buy glass totals changes
    case buyGlassTotalChanged(Int)
    
    /// Given currency pair sell glass row changes.
    ///
    /// Returns the added or changed glass row data.
    /// In case the amount is zero this means the row should be removed from the glass
    case sellGlassRowChanged(Int)
    
    /// Given currency pair buy glass row changes.
    ///
    /// Returns the added or changed glass row data.
    /// In case the amount is zero this means the row should be removed from the glass
    case buyGlassRowChanged(Int)
    
    /// Changes of the best bid price for given currency pair and orders type
    case bidBestPriceChanged(Int)
    
    /// Changes of the best ask price for given currency pair and orders type
    case askBestPriceChanged(Int)
    
    /// Changes of the chart candles for given currency pair of the given chart type
    case candleChanged(CandlesType, Int)
    
    /// Balance changes of the given wallet
    case balanceChanged(Int)
    
    /// User sell order changes for given currency_pair
    ///
    /// Parameters:
    ///  - Int: `user_id`
    ///  - Int: `pair_id`
    case sellUserOrder(Int, Int)
    
    /// User buy order changes for given currency_pair
    ///
    /// Parameters:
    ///  - Int: `user_id`
    ///  - Int: `pair_id`
    case buyUserOrder(Int, Int)
    
    /// Any type of finishing (including the cancelling) of the user orders for given currency pair
    ///
    /// Parameters:
    ///  - Int: `user_id`
    ///  - Int: `pair_id`
    case userOrderDeleted(Int, Int)
    
    /// Channels for event.
    var channel: String {
        switch self {
        case .rate:
            return StexSocketConstants.Channels.rate
        case .tradeCreated(let pairId):
            return StexSocketConstants.Channels.tradeCreated + "\(pairId)"
        case .sellGlassTotalChanged(let pairId):
            return StexSocketConstants.Channels.sellGlassTotalChanget + "\(pairId)"
        case .buyGlassTotalChanged(let pairId):
            return StexSocketConstants.Channels.buyGlassTotalChanget + "\(pairId)"
        case .sellGlassRowChanged(let pairId):
            return StexSocketConstants.Channels.sellGlassRowChanget + "\(pairId)"
        case .buyGlassRowChanged(let pairId):
            return StexSocketConstants.Channels.buyGlassRowChanged + "\(pairId)"
        case .bidBestPriceChanged(let pairId):
            return StexSocketConstants.Channels.bidBestPriceChanged + "\(pairId)"
        case .askBestPriceChanged(let pairId):
            return StexSocketConstants.Channels.askBestPriceChanged + "\(pairId)"
        case .candleChanged(let type, let pairId):
            return String(format: StexSocketConstants.Channels.candleChanged, type.rawValue, "\(pairId)")
        case .balanceChanged(let walletId):
            return StexSocketConstants.Channels.balanceChanged + "\(walletId)"
        case .sellUserOrder(let userId, let pairId):
            return String(format: StexSocketConstants.Channels.sellUserOrder, "\(userId)", "\(pairId)")
        case .buyUserOrder(let userId, let pairId):
            return String(format: StexSocketConstants.Channels.buyUserOrder, "\(userId)", "\(pairId)")
        case .userOrderDeleted(let userId, let pairId):
            return String(format: StexSocketConstants.Channels.delUserOrder, "\(userId)", "\(pairId)")
        }
    }
    
    /// Is private event
    var isPrivate: Bool {
        switch self {
        case .rate,
             .tradeCreated(_),
             .sellGlassTotalChanged(_),
             .buyGlassTotalChanged(_),
             .sellGlassRowChanged(_),
             .buyGlassRowChanged(_),
             .bidBestPriceChanged(_),
             .askBestPriceChanged(_),
             .candleChanged(_, _):
            
            return false
            
        case .balanceChanged(_),
             .sellUserOrder(_, _),
             .buyUserOrder(_, _),
             .userOrderDeleted(_, _):
            
            return true
        }
    }
}
