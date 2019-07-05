//
//  MarketsReqest.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 7/5/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Alamofire

/**
 Available markets.
 Get list of all avialable markets.
 */

class MarketsReqest: IRequest {
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return PublicEndpoints.markets.path
    }
}
