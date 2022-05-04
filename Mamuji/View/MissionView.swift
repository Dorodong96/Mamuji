//
//  MissionView.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

struct MissionView: View {
    @ObservedObject var vm = MissionViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("도전과제")
                .font(.custom("BMDoHyeon-OTF", size: 35))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.horizontal)
            
            missionPage
            
            if vm.getState() {
                missionComplete
            } else {
                missionContinue
            }
            
        }
    }
    
    private var missionPage: some View {
        ZStack {
            Image("paper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 352, height: 350, alignment: .center)
                .clipped()
            
            Text("오늘의 도전과제")
                .font(.custom("BMDoHyeon-OTF", size: 20))
                .frame(maxWidth: .infinity, maxHeight: 20, alignment: .center)
                .position(x: UIScreen.main.bounds.width/2, y: 50)
            
            Rectangle()
                .foregroundColor(.black)
                .frame(maxWidth: 300, maxHeight: 2)
                .position(x: UIScreen.main.bounds.width/2, y: 70)
            
            Text(vm.getContent())
                .frame(width: 300, height: 150, alignment: .center)
                .font(.custom("", size: 50))
        }
    }
    
    private var missionContinue: some View {
        VStack{
            Text("도전 진행중...!")
                .font(.custom("BMDoHyeon-OTF", size: 25))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(5)
            
            Button {
                vm.changeState()
            } label: {
                
                Text("완료하기!")
                    .font(.custom("BMDoHyeon-OTF", size: 70))
                
            }
            .frame(width: 350, height: 140, alignment: .center)
        }
        .frame(width: 350, height: 250, alignment: .center)
    }
    
    private var missionComplete: some View {
        VStack{
            ZStack() {
                Image("rainbow3")
                    .resizable()
                    .frame(width: 330, height: 330, alignment: .center)
                    .opacity(0.7)
                Text("오늘의 도전 완료!")
                    .font(.custom("BMDoHyeon-OTF", size: 30))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(5)
                    .padding(.top)
            }
            
        }
        .frame(width: 350, height: 250, alignment: .center)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView()
    }
}
