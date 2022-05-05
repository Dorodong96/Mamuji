//
//  MyPageView.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

struct MyPageView: View {
    private var columns = Array(repeating: GridItem(.flexible(minimum: 80, maximum: 170), spacing: 0), count: 2)
    
    // dummyData
    @State var totalTask = 120
    @State var checkedTask = 45
    
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
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 352, height: 50, alignment: .center)
                    .foregroundColor(Color(UIColor.systemGray5))
                
                
                HStack(spacing:0) {
                    Color(UIColor.systemGray2)
                        .cornerRadius(8, corners: [.topLeft, .bottomLeft])
                        .frame(width: CGFloat(checkedTask * 346 / totalTask), height: 42, alignment: .leading)
                    Color(UIColor.systemGray5)
                        .cornerRadius(10, corners: [.topRight, .bottomRight])
                        .frame(width: CGFloat(346-(checkedTask * 346 / totalTask)), height: 42, alignment: .leading)
                }
                
                Text("\(checkedTask * 100 / totalTask)%")
                    .font(.custom("BMDoHyeon-OTF", size: 18))
            }
            
            Text("잘 하고 있지 우리 아들 ~ ^_^")
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
                ForEach(0..<4) { index in
                    
                    ZStack {
                        if index == 0 {
                            Image("pig")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100, alignment: .bottom)
                                .padding(.top, 30)
                        }
                        
                        Image("vinyl")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 170, alignment: .center)
                            .clipped()
                            .padding(.vertical)
                            .opacity(0.5)
                        
                        
                    }
                    
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

// Clipped Rounded Rectangle
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// View Extension for cornerRadius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
