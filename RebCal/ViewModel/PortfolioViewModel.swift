//
//  PortfolioViewModel.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/23.
//

import SwiftUI

class PortfolioViewModel: ObservableObject{

    @Published var id: Int
    @Published var name: String
    @Published var portfolioItem: [Asset]?
    @Published var portfolioStruct: [String: Int]?
    @Published var createDate: Date = Date()
    @Published var updateDate: Date?
    
    init(){
        self.id = 1
        self.name = "TQQQ Portfolio"
        self.createDate = Date()
        
    }
    
    func getUserDateToString(userDate:Date) -> String {
        let formatter = DateFormatter() //객체 생성
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy년 MM월 dd일" //데이터 포멧 설정
        let strDate = formatter.string(from: userDate)
        
        return strDate
    }
}
