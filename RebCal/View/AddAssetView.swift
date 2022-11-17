//
//  AddAssetView.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/12.
//

import SwiftUI

struct AddAssetView: View {
    
    @ObservedObject var assetViewModel = AssetViewModel()
    @State var assetTicker: String = ""
    
    var body: some View {
        VStack{
            Text(assetViewModel.selectedAsset)
            HStack{
                TextField("Ticker", text: $assetTicker)
                .frame(width: 200, height: 20)
                .padding()
                Button("검색"){
                    assetViewModel.selectAsset()
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
