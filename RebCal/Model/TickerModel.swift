//
//  TickerModel.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/19.
//

import Foundation

struct Ticker: Codable{
    var market: String?
    var korean_name: String?
    var english_name: String?
}

//let url = "https://api.upbit.com/v1/market/all"
