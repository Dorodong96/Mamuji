//
//  ContentView.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemGray2
    }
    
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
        .accentColor(Color(0x757575))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Color Extension for hex Code
extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}
