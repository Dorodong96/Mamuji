//
//  ContentView.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemGray4
    }
    
    var body: some View {
        TabView {
            HomeView(interval: .init()) { _ in
                Text("1")
                    .padding(20)
                    .background(Color(.systemGray4))
                    .cornerRadius(8)
            }
                .tabItem{
                    Label {
                        Text("홈")
                    } icon: {
                        Image(systemName: "house")
                    }
                }
            
            MissionView()
                .tabItem{
                    Label {
                        Text("미션")
                    } icon: {
                        Image(systemName: "note.text")
                    }
                }
            
            MyPageView()
                .tabItem{
                    Label {
                        Text("마이페이지")
                    } icon: {
                        Image(systemName: "person.circle")
                    }
                }
        }
        .accentColor(Color(.systemGray))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
