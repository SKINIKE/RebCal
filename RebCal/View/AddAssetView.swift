//
//  AddAssetView.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/12.
//

import SwiftUI

struct AddAssetView: View {
    
    @Environment(\.dismiss) var dismiss //modified
    
    @ObservedObject var assetViewModel = AssetViewModel()
    @State private var selectedMarket = markets.KRW
    @State var assetTicker: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Text(assetViewModel.selectedAsset)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            if(assetViewModel.tradePrice == ""){
                
            }
            else{
                AssetInfoView()
            }
            Spacer()
            bottomTickerSearchbar()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button("취소"){
                    dismiss()
            },
            trailing:
                Button("추가"){
                    dismiss()
        })
    }
    
    fileprivate func AssetInfoView() -> some View {
        return VStack{
            Text("현재가: \(assetViewModel.tradePrice) \(selectedMarket.strId)")
                .font(.title2)
                .padding()
            Text("\(assetViewModel.lowPrice) ~ \(assetViewModel.highPrice)")
                .foregroundColor(Color.gray)
                .padding([.bottom], 5)
            Text("\(assetViewModel.signedChangeRate)%")
                .foregroundColor(Color.gray)
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color(red: 0.4627, green: 0.8392, blue: 1.0)))
    }
    
    fileprivate func bottomTickerSearchbar() -> some View {
        return HStack{
            Picker("통화", selection: $selectedMarket) {
                Text("KRW").tag(markets.KRW)
                Text("USDT").tag(markets.USDT)
                Text("BTC").tag(markets.BTC)
            }
            .frame(width:100, height: 20)
            .padding()
            Spacer()
            TextField("Ticker(ex: BTC)", text: $assetTicker)
                .frame(width: 150, height: 20)
                .padding([.top, .bottom])
            Spacer()
            if(assetTicker == ""){
                Button("Ticker 검색"){
                    print("앗 아직 안돼용ㅎ")
                }
                .frame(width:100, height: 20)
                .padding()
            }
            else{
                Button("검색"){
                    assetViewModel.selectAsset(userTicker: assetTicker, userMarket: selectedMarket.strId)
                }
                .frame(width:100, height: 20)
                .padding()
            }
        }
        .padding()
    }
}

enum markets: String, CaseIterable, Identifiable {
    case KRW, USDT, BTC
    var id: Self { self }
    var strId: String {
       String(describing: self)
   }
}

struct AddAssetView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddAssetView()//testcode
    }
}
