//
//  NSDate-Extension.swift
//  DouyuTV
//
//  Created by mac on 2020/1/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

extension Date{
    static func getCurrentTime() ->String {
        let nowDate = Date();
        let interval = Int(nowDate.timeIntervalSince1970);
        return "\(interval)";
    }
}
