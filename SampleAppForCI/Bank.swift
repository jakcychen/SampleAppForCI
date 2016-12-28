//
//  Bank.swift
//  SampleAppForCI
//
//  Created by JackyChen on 2016/12/20.
//  Copyright © 2016年 JackyChen. All rights reserved.
//

import UIKit

class Bank: NSObject
{
    static func CalculateBalance(capital: Float!, interest: Float!)->Float!
    {
        return capital + capital * interest
    }
}
