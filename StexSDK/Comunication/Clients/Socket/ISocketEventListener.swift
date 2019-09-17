//
//  ISocketEventListener.swift
//  StexSDK
//
//  Created by Alexander Rudyk on 8/13/19.
//  Copyright © 2019 beleven. All rights reserved.
//

import Foundation

public protocol ISocketEventListener {
    func socket(_ socketClient: StexSocketClient, connectWith data: [Any])
    func socket(_ socketClient: StexSocketClient, disconnectWith data: [Any])
    
    func socket(_ socketClient: StexSocketClient, receiveRatesWith data: [StexRate])
    func socket(_ socketClient: StexSocketClient, receiveTradesCreatedWith data: [StexOrderCreated])
    func socket(_ socketClient: StexSocketClient, receiveGlassTotalChangedWith data: [StexGlassTotalChanged])
    func socket(_ socketClient: StexSocketClient, receiveGlassRowChangedWith data: [StexGlassRowChanged])
    func socket(_ socketClient: StexSocketClient, receiveBestPriceChangedWith data: [StexBestPriceChanged])
    func socket(_ socketClient: StexSocketClient, receiveCandleChangedWith data: [StexCandleChanged])
    func socket(_ socketClient: StexSocketClient, receiveBalanceChangedWith data: [StexBalanceChanged])
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersWith data: [StexUserOrder])
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersDeletedWith data: [StexUserOrderDeleted])
}

extension ISocketEventListener {
    func socket(_ socketClient: StexSocketClient, connectWith data: [Any]) {}
    func socket(_ socketClient: StexSocketClient, disconnectWith data: [Any]) {}
    
    func socket(_ socketClient: StexSocketClient, receiveTickerWith data: [StexRate]) {}
    func socket(_ socketClient: StexSocketClient, receiveTradesCreatedWith data: [StexOrderCreated]) {}
    func socket(_ socketClient: StexSocketClient, receiveGlassTotalChangedWith data: [StexGlassTotalChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveGlassRowChangedWith data: [StexGlassRowChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveBestPriceChangedWith data: [StexBestPriceChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveCandleChangedWith data: [StexCandleChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveBalanceChangedWith data: [StexBalanceChanged]) {}
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersWith data: [StexUserOrder]) {}
    func socket(_ socketClient: StexSocketClient, receiveUserOrdersDeletedWith data: [StexUserOrderDeleted]) {}
}
