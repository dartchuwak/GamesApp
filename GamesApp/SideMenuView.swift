//
//  SideMenuView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedView: SideMenuViewModel
    @Binding var isShowing: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                VStack(alignment: .leading) {
                    SideMenuHeaderView()
                    Text("New Releases")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    ForEach(SideMenuViewModel.allCases, id: \.self) { item in
                        RowView(image: item.image , text: item.titile)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .onTapGesture {
                                selectedView = item
                                withAnimation(.spring()) {
                                    isShowing.toggle()
                                    print("Menu")
                                }
                            }
                    }
                    Spacer()
                }
            }
            .frame(width: geometry.size.width * 2 / 3)
            .position(x: geometry.size.width * 1 / 3, y: geometry.size.height / 2)
        }
    }
}


struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(selectedView: .constant(.newAndTrending), isShowing: .constant(false))
    }
}
