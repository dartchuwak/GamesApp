//
//  FilterView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 24.05.2023.
//

import SwiftUI


struct FilterView: View {
    
    @Binding var selectedOrder: SortOrders
    @Binding var selectedPlatform: FilterPlatforms
    @EnvironmentObject var vm: ViewModel
    var body: some View {
            HStack {
                HStack(spacing: 0) {
                    Text("Order by:")
                        .foregroundColor(Color.white)
                    Picker("Order by:", selection: $selectedOrder) {
                        ForEach(SortOrders.allCases, id: \.self) { option in
                            HStack {
                                Image(systemName: option.ordersOrder)
                                    .frame(width: 16, height: 16)
                                Text(option.ordersTitle)
                                    .accentColor(Color.white)
                             
                            }
                        }

                    }
                    .accentColor(Color.white)
                    .pickerStyle(.menu)
                    .onChange(of: selectedOrder) { option in
                        vm.handleSelectionChange(option: option)
                    }

                }
                .padding(.horizontal, 4)
                .background(Color.init(white: 0.20))
                .cornerRadius(5)
                
                HStack(spacing:0) {
                    Picker("Platforms:", selection: $selectedPlatform) {
                        ForEach(FilterPlatforms.allCases, id: \.self) { option in
                            Text(option.platformsTitles)
                                .fontWeight(.bold)
                                .accentColor(Color.white)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedPlatform) { option in
                        print("Platform changed: \(option)")
                    }
                    .accentColor(Color.white)
                }
                .padding(.horizontal, 4)
                .background(Color.init(white: 0.20))
                .cornerRadius(5)
                
                Spacer()
                
            }.padding(.horizontal)
        }
}

struct FilterView_Previews: PreviewProvider {
    @State static var selectedOrder: SortOrders = .popularity
    @State static var selectedPlatform: FilterPlatforms = .pc
    @StateObject static var viewModel = ViewModel(networkService: NetworkService())

    static var previews: some View {
        FilterView(selectedOrder: $selectedOrder, selectedPlatform: $selectedPlatform)
            .environmentObject(viewModel)
    }
}

