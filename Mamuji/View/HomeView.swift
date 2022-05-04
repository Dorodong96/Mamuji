//
//  HomeView.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

struct HomeView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("메무지")
                        .font(.custom("BMDoHyeon-OTF", size: 55))
                        .fontWeight(.bold)
                        .frame(width: 160, height: 80, alignment: .leading)
                        .padding(.top)
                    Image("rainbow2")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Custom Date Picker
                        CustomDatePicker(currentDate: $currentDate)
                    }
                    .padding()
                }
                .navigationBarTitle("홈")
                .navigationBarHidden(true)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
