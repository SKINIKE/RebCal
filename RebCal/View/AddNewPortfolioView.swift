//
//  AddNewPortfolioView.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/11.
//

import SwiftUI

struct AddNewPortfolioView: View {
    
    @State var portfolioName: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("포트폴리오명을 입력하세요", text: $portfolioName)
                        .frame(width: 200, height: 20)
                        .padding()
                    Spacer()
                    Button("저장"){
                        //saveNewPortfolio()
                        print("저장합니당")
                    }
                    .frame(width:50, height: 20)
                    .padding()
                }
                Text("포트폴리오명: \(portfolioName)")
                Spacer()
                ScrollView(){
                    LazyVStack{
                        ForEach(1..<50) { i in
                            Text("Item \(i)") //$표시 필수
                                .font(.title)
                        }
                        //ScrollView 내부에서 사용
                        //중앙에서만 탭(스크롤)이 가능했던것을 프레임으로 전체로 늘려줌
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(height: 200)
                NavigationLink("자산추가"){
                    AddAssetView()
                }
                .frame(width: 300)
                .padding()
            }
        }
    }
}

struct AddNewPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPortfolioView()
    }
}
