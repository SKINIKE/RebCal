//
//  AssetViewModel.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/17.
//

import SwiftUI

class AssetViewModel: ObservableObject{
    
    @Published var test: Int = 0
    
    @Published var selectedAsset: String = ""
    @Published var tradePrice: String = ""
    @Published var highPrice: String = ""
    @Published var lowPrice: String = ""
    @Published var signedChangeRate: String = ""
    
    init(){
        self.selectedAsset = "자산을 검색해주세요"
        self.tradePrice = ""
        self.highPrice = ""
        self.lowPrice = ""
        self.signedChangeRate = ""
    }
    
    func selectAsset(userTicker: String, userMarket: String){
        // [URL 지정 및 파라미터 값 지정 실시]
        var urlComponents = URLComponents(string: "https://api.upbit.com/v1/ticker?")
        let markets_value = userMarket + "-" + userTicker
        let paramQuery_markets = URLQueryItem(name: "markets", value: markets_value)
        urlComponents?.queryItems?.append(paramQuery_markets) // 파라미터 지정
        
        var requestURL = URLRequest(url: (urlComponents?.url)!)
               requestURL.httpMethod = "GET" // GET
               requestURL.addValue("application/x-www-form-urlencoded; charset=utf-8;", forHTTPHeaderField: "Content-Type") // GET
        //print("url : ", requestURL)
        
        // [http 요쳥을 위한 URLSessionDataTask 생성]
        let dataTask = URLSession.shared.dataTask(with: requestURL){ (data, response, error) in
        
            // [error가 존재하면 종료]
            guard error == nil else {
                print("fail : ", error?.localizedDescription ?? "")
                DispatchQueue.main.async {
                    self.selectedAsset = "fail : \(error?.localizedDescription ?? "")"
                    self.makingInfoToNil()
                }
                return
            }
        
            // [status 코드 체크 실시]
            let successsRange = 200..<300
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, successsRange.contains(statusCode)
            else {
                print("error : ", (response as? HTTPURLResponse)?.statusCode ?? 0)
                print("msg : ", (response as? HTTPURLResponse)?.description ?? "")
                DispatchQueue.main.async {
                    if(((response as? HTTPURLResponse)?.statusCode ?? 0) == 404){
                        self.selectedAsset = "자산을 찾을수 없습니다.\n통화 또는 Ticker를\n확인해주세요"
                        self.makingInfoToNil()
                    }else{
                        self.selectedAsset = "error : \((response as? HTTPURLResponse)?.statusCode ?? 0)"
                        self.makingInfoToNil()
                    }
                }
                return
            }
        
            // [response 데이터 획득, Asset객체로 json을 파싱]
            let decoder = JSONDecoder()
            //snake_case를 camelCase로 변환
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let asset = try? decoder.decode([Asset].self, from: data!) {
                self.bindingAseetInfo(asset: asset[0])
            }
        }
        
        // network 통신 실행
        dataTask.resume()
    }
    
    func bindingAseetInfo(asset:Asset){
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 7
        numberFormatter.numberStyle = .decimal
           
        
        //ui를 변경하는 published 변수는 백그라운드가 아닌 main스레드에서 변경하도록 한다.
        DispatchQueue.main.async {
            self.selectedAsset = asset.market!
            self.tradePrice = numberFormatter.string(from: NSNumber(value: asset.tradePrice!))!
            self.highPrice = numberFormatter.string(from: NSNumber(value: asset.highPrice!))!
            self.lowPrice = numberFormatter.string(from: NSNumber(value: asset.lowPrice!))!
            self.signedChangeRate = numberFormatter.string(from: NSNumber(value: asset.signedChangeRate!))!
        }
    }
    
    func makingInfoToNil(){
        self.tradePrice = ""
        self.highPrice = ""
        self.lowPrice = ""
        self.signedChangeRate = ""
    }
    
    //testcode
    func testInt(){
        self.test += 1
    }
}
