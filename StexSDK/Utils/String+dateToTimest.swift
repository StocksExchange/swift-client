//
//  String+dateToTimest.swift
//  StexSDK
//
//  Created by Hanna Karnaukh on 10.03.2020.
//  Copyright © 2020 beleven. All rights reserved.
//

import Foundation

extension String {
    
    public func dateToTimest() -> Int? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        
        guard let date = dateFormatter.date(from: self) else { return nil }
        
        let timeInterval = date.timeIntervalSince1970
        return Int(timeInterval)
    }
}
