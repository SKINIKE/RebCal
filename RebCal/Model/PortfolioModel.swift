//
//  PortfolioModel.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/23.
//

import Foundation

struct Portfolio: Codable{
    var id: Int
    var name: String
    var portfolioItem: [Asset]?
    var portfolioStruct: [String: Int]?
    var createDate: Date
    var updateDate: Date?
}
