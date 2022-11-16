//
//  AssetModel.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/16.
//

import Foundation

struct Asset: Codable{
    var market: String = "KRW-BTC"
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


//api호출 예제
//// [URL 지정 및 파라미터 값 지정 실시]
//var urlComponents = URLComponents(string: "https://api.upbit.com/v1/ticker?")
//let market = "KRW"
//let ticker = "BTC"
//let markets_value = market + "-" + ticker
//let paramQuery_markets = URLQueryItem(name: "markets", value: markets_value)
//urlComponents?.queryItems?.append(paramQuery_markets) // 파라미터 지정
//
//var requestURL = URLRequest(url: (urlComponents?.url)!)
//       requestURL.httpMethod = "GET" // GET
//       requestURL.addValue("application/x-www-form-urlencoded; charset=utf-8;", forHTTPHeaderField: "Content-Type") // GET
////print("url : ", requestURL)
//
//// [http 요쳥을 위한 URLSessionDataTask 생성]
//let dataTask = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
//
//    // [error가 존재하면 종료]
//    guard error == nil else {
//        print("fail : ", error?.localizedDescription ?? "")
//        return
//    }
//
//    // [status 코드 체크 실시]
//    let successsRange = 200..<300
//    print(successsRange)
//    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, successsRange.contains(statusCode)
//    else {
//        print("error : ", (response as? HTTPURLResponse)?.statusCode ?? 0)
//        print("msg : ", (response as? HTTPURLResponse)?.description ?? "")
//        return
//    }
//
//    // [response 데이터 획득, Asset객체로 json을 파싱]
//    let decoder = JSONDecoder()
//    decoder.keyDecodingStrategy = .convertFromSnakeCase
//    if let asset = try? decoder.decode([Asset].self, from: data!) {
//        print(asset[0])
//    }
//}
//
//// network 통신 실행
//dataTask.resume()
//
