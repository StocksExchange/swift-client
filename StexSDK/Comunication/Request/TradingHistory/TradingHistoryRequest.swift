//
//  TradingHistoryRequest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 9/9/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

class TradingHistoryRequest: IRequest {
    
    private let orderId: Int?
    
    private let pairId: Int?
    private let orderStatus: StexOrderStatus?
    private let limit: Int?
    private let offset: Int?
    
    init(orderId: Int) {
        self.orderId = orderId
        
        pairId = nil
        orderStatus = nil
        limit = nil
        offset = nil
    }
    
    init(pairId: Int? = nil, orderStatus: StexOrderStatus = .all, limit: Int = 100, offset: Int? = nil) {
        self.pairId = pairId
        self.orderStatus = orderStatus
        self.limit = limit
        self.offset = offset
        
        orderId = nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        var path = TradingHistoryEndpoints.orders.path
        
        path += orderId == nil ? "" : "/\(orderId!)"
        
        return path
    }
    
    func parameters() -> Parameters? {
        guard orderId == nil else { return nil }
        
        var param: Parameters = [:]
        
        if let pairId = pairId {
            param[StexServerConstants.pairId] = pairId
        }
        
        if let orderStatus = orderStatus {
            param[StexServerConstants.orderStatus] = orderStatus.rawValue
        }
        
        if let limit = limit {
            param[StexServerConstants.limit] = limit
        }
        
        if let offset = offset {
            param[StexServerConstants.offset] = offset
        }
        
        return param
    }
}
