//
//  MainView.swift
//  RebCal
//
//  Created by Kwangil Shin on 2022/11/11.
//

import SwiftUI

struct MainView: View {
    
    //탭뷰를 코드로 전환할때를 대비한 selection변수
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            DashboardView()
            .tabItem {
                Label("대시보드", systemImage: "chart.pie")
            }
            .tag(0)
            CalculatorView()
            .tabItem {
                Label("계산기", systemImage: "plus.forwardslash.minus")
            }
            .tag(1)
            AddNewPortfolioView()
            .tabItem {
                Label("추가", systemImage: "plus")
            }
            .tag(2)
            SettingView()
            .tabItem {
                Label("설정", systemImage: "gear")
            }
            .tag(3)
        }
        .accentColor(.red)
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
            UITabBar.appearance().unselectedItemTintColor = UIColor.black
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
