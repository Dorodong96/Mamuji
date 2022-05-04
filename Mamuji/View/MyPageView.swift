//
//  MyPageView.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

struct MyPageView: View {
    private var columns = Array(repeating: GridItem(.flexible(minimum: 80, maximum: 170), spacing: 0), count: 2)
    
    var body: some View {
        VStack(spacing: 0) {
            Text("마이페이지")
                .font(.custom("BMDoHyeon-OTF", size: 35))
                .frame(maxWidth: .infinity, alignment: .leading)
            
                .padding(.top)
                .padding(.horizontal)
            
            statusView
            
            stickerView
            
        }
    }
    
    private var statusView: some View {
        VStack(spacing: 5) {
        Text("평균달성률")
            .font(.custom("BMDoHyeon-OTF", size: 25))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 352, height: 50, alignment: .center)
            .foregroundColor(.gray)
        
        Text("조금만 더 열심히 해보자!")
            .font(.custom("BMDoHyeon-OTF", size: 20))
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.gray)
            .padding(.top, 5)
        }
    }
    
    private var stickerView: some View {
        ZStack {
            Image("paper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 352, height: 450, alignment: .center)
                .clipped()
            
            VStack {
                Text("스티커 도감")
                    .font(.custom("BMDoHyeon-OTF", size: 20))
                    .frame(maxWidth: .infinity, maxHeight: 20, alignment: .center)
                
                Rectangle()
                    .foregroundColor(.black)
                    .frame(maxWidth: 300, maxHeight: 2)
                }
                .position(x: UIScreen.main.bounds.width/2, y: 60)
                
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0..<4) { _ in
                    Image("vinyl")
                        .resizable()
                        .aspectRatio(contentMode: .fill
                        )
                        .frame(width: 120, height: 170, alignment: .center)
                        .clipped()
                        .padding(.vertical)
                }
            }.padding(.top, 40)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
