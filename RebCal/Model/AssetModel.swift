//
//  AssetModel.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/16.
//

import Foundation

struct Asset: Codable{
    var market: String?
    var tradeDate: String?
    var tradeTime: String?
    var tradeDateKst: String?
    var tradeTimeKst: String?
    var tradeTimestamp: CLong? //api문서의 데이터 타입대로 선언
    var openingPrice: Double?
    var highPrice: Double?
    var lowPrice: Double?
    var tradePrice: Double?
    var prevClosingPrice: Double?
    var change: String?
    var changeRate: Double?
    var signedChangePrice: Double?
    var signedChangeRate: Double?
    var tradeVolume: Double?
    var accTradePrice: Double?
    var accTradePrice24h: Double?
    var accTradeVolume: Double?
    var accTradeVolume24h: Double?
    var highest52WeekPrice: Double?
    var highest52WeekDate: String?
    var lowest52WeekPrice: Double?
    var lowest52WeekDate: String?
    var timestamp: CLong? //api문서의 데이터 타입대로 선언
}
