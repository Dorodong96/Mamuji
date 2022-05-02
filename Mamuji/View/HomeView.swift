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
            Text("메무지")
                    .font(.custom("", size: 40))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                                
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // Custom Date Picker
                    CustomDatePicker(currentDate: $currentDate)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("")
                    .navigationBarHidden(true)

            // Safe Area View
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Button {
                        
                    } label: {
                        Text("Add Task")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.orange, in: Capsule())
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Add Remainder")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.purple, in: Capsule())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
            }
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
