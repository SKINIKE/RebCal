//
//  AddAssetView.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/12.
//

import SwiftUI

struct AddAssetView: View {
    
    @ObservedObject var assetViewModel = AssetViewModel()
    @State private var selectedMarket = markets.KRW
    @State var assetTicker: String = ""
    
    var body: some View {
        VStack{
            Text(assetViewModel.selectedAsset)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .padding()
            Text(assetViewModel.tradePrice)
            Spacer()
            HStack{
                Picker("통화", selection: $selectedMarket) {
                  Text("KRW").tag(markets.KRW)
                  Text("USDT").tag(markets.USDT)
                  Text("BTC").tag(markets.BTC)
                }
                .padding([.top, .bottom])
                TextField("Ticker(ex: BTC)", text: $assetTicker)
                .frame(width: 150, height: 20)
                .padding([.top, .bottom])
                Button("검색"){
                    assetViewModel.selectAsset(userTicker: assetTicker, userMarket: selectedMarket.strId)
                }
                .frame(width:50, height: 20)
                .padding()
            }
        }
    }
}

struct AddAssetView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssetView()
    }
}

enum markets: String, CaseIterable, Identifiable {
    case KRW, USDT, BTC
    var id: Self { self }
    var strId: String {
       String(describing: self)
   }
}
