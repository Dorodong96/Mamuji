//
//  ContentView.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
